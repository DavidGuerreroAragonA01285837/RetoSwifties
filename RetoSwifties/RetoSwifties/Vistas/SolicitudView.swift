//
//  SolicitudView.swift
//  RetoSwifties
//
//  Created by Alumno on 27/08/25.
//

import SwiftUI

struct SolicitudView: View {
    @State private var SiguientePantalla = false
    @State private var graphValues = [0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 295, 0, 0, 0, 0, 0]
    @StateObject var solicitudTurno = TurnViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Color(red: 0.0039, green: 0.4078, blue: 0.5411)
                        .ignoresSafeArea(edges: .top)

                    Graph()
                        .padding(.top, 18)
                        .padding(.horizontal, 16)
                }
                .frame(height: 500)
                .clipped()
                
                HStack {
                    Text("Tiempo estimado: ")
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color(red: 242/255, green: 242/255, blue: 242/255))
                        .padding(.vertical, 15)
                        .padding(.horizontal, 10)
                        .background(Color(red: 1.0, green: 0.6, blue: 0.0))
                        .cornerRadius(10)
                        .padding(.top, 50)
                
                    
                    Text("20 min")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color(red: 0.0039, green: 0.4078, blue: 0.5411))
                        .offset(y: 25)
                        .padding(.horizontal, 10)
                }
                
                Button(action: {
                    // Call the API and wait for the response before navigating
                    solicitudTurno.requestTurn(preferential: 0) { turn in
                        if turn != nil {
                            // Navigate only after the API returns
                            SiguientePantalla = true
                        }
                    }
                }) {
                    Text("Obtener turno")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal, 30)
                        .padding(.vertical, 16)
                        .background(Color(red: 0.0039, green: 0.4078, blue: 0.5411))
                        .foregroundColor(Color(red: 242/255, green: 242/255, blue: 242/255))
                        .cornerRadius(10)
                }
                .padding(.top, 50)
                .navigationDestination(isPresented: $SiguientePantalla) {
                    if let turn = solicitudTurno.turn {
                        ConfirmacionTurnoView(
                            folio: "\(turn.ServiceID)",
                            numeroTurno: turn.TurnNumber,
                            turnoActual: turn.NextTurn
                        )
                    }

                }
                
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SolicitudView()
}

