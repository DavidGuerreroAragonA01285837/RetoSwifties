//
//  SolicitudView.swift
//  RetoSwifties
//
//  Created by Alumno on 27/08/25.
//

import SwiftUI

struct SolicitudView: View {
    @State private var SiguientePantalla = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Color(red: 0.0039, green: 0.4078, blue: 0.5411)
                        .ignoresSafeArea(edges: .top)

                    Graph()
                        .padding(.top, 20)
                        .padding(.horizontal, 16)
                }
                
                .frame(height: 500)
                .clipped()
                
                HStack {
                    Text("Tiempo estimado: ")
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color(red: 68/255, green: 68/255, blue: 68/255))
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
                    SiguientePantalla = true
                }) {
                    Text("Obtener turno")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal, 30)
                        .padding(.vertical, 16)
                        .background(Color(red: 0.0039, green: 0.4078, blue: 0.5411)) // azul
                        .foregroundColor(Color(red: 242/255, green: 242/255, blue: 242/255))
                        .cornerRadius(10)
                }
                .padding(.top, 50)
                .navigationDestination(isPresented: $SiguientePantalla) {
                    ConfirmacionTurnoView()
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

