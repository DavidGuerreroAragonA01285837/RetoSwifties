//
//  Main.swift
//  RetoSwifties
//
//  Created by Alumno on 27/08/25.
//

import SwiftUI

struct Main: View {
    @State private var irASiguiente = false
    
    var body: some View {
        ZStack {
            VStack {
                Image("hospital_clnica_nova_logo")
                    .padding(.top, 50)
                Text("Bienvenido a Clinica NOVA")
                    .padding(.top, 150)
                    .font(.title)
                    .underline()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // ocupa toda la pantalla
        .contentShape(Rectangle()) // hace clickeable todo
        .onTapGesture {
            irASiguiente = true
        }
        // En lugar de usar NavigationStack, usamos fullScreenCover
        .fullScreenCover(isPresented: $irASiguiente) {
            SolicitudView()
                .interactiveDismissDisabled(true) // evita cerrar con swipe down
        }
        HStack(spacing: 20) {
            Button(action: {
                
            }) {
                Image(systemName: "text.book.closed")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .frame(width: 56, height: 56) // tamaño fijo e igual para todos
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(red: 217/255, green: 217/255, blue: 217/255))
                    )
            }

            Button(action: {
                
            }) {
                Image(systemName: "map")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .frame(width: 56, height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(red: 217/255, green: 217/255, blue: 217/255))
                    )
            }

            Button(action: {
                
            }) {
                Image(systemName: "phone.arrow.up.right.circle")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .frame(width: 56, height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(red: 217/255, green: 217/255, blue: 217/255))
                    )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading) // si los quieres pegados a la izquierda
        .padding(.horizontal, 24) // margen con los bordes
        .padding(.top, 16)

        }
    }//Cierre del view


#Preview {
    Main()
}

