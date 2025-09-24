//
//  TurnosModelJSON.swift
//  RetoSwifties-ManagementSide
//
//  Created by David on 23/09/25.
//

import Foundation
import Combine


// MARK: - Unsafe delegate for self-signed certificates
class UnsafeSessionDelegate: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if let serverTrust = challenge.protectionSpace.serverTrust {
            completionHandler(.useCredential, URLCredential(trust: serverTrust))
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}

// MARK: - ViewModel to make API call
class TurnViewModel: ObservableObject {
    @Published var turn: TurnResponse? = nil
    
    func requestTurn(preferential: Int = 0, completion: ((TurnResponse?) -> Void)? = nil) {
        guard let url = URL(string: "https://10.14.255.40:10206/turnos/solicitar") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Body with Preferential only
        let body: [String: Any] = ["Preferential": preferential]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        let session = URLSession(configuration: .default,
                                 delegate: UnsafeSessionDelegate(),
                                 delegateQueue: nil)

        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("POST error:", error)
                DispatchQueue.main.async {
                    completion?(nil)
                }
                return
            }

            if let http = response as? HTTPURLResponse {
                print("POST status code:", http.statusCode)
            }

            if let data = data {
                // Print raw response for debugging
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw response:\n\(jsonString)")
                }

                do {
                    let decoded = try JSONDecoder().decode(TurnResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.turn = decoded
                        completion?(decoded)
                    }
                } catch {
                    print("Decoding error:", error)
                    DispatchQueue.main.async {
                        completion?(nil)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion?(nil)
                }
            }
        }.resume()
    }
    func deleteTurn(serviceID: Int, completion: ((Bool) -> Void)? = nil) {
        guard let url = URL(string: "https://10.14.255.40:10206/turnos/eliminar") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"  // or DELETE if your API accepts it
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Body with serviceID
        let body: [String: Any] = ["serviceID": serviceID]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        let session = URLSession(configuration: .default, delegate: UnsafeSessionDelegate(), delegateQueue: nil)

        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("DELETE error:", error)
                completion?(false)
                return
            }

            if let http = response as? HTTPURLResponse {
                print("DELETE status code:", http.statusCode)
            }

            if let data = data {
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw response:", jsonString)
                }
                // Optional: check if deleted_serviceID exists in the response
                completion?(true)
            } else {
                completion?(false)
            }
        }.resume()
    }

}
