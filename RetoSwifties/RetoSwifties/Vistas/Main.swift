//
//  SwiftUIView.swift
//  RetoSwifties
//
//  Created by Alumno on 28/08/25.
//


import SwiftUI

struct Main: View {
    @State private var irASiguiente = false
    @State private var mostrarSheet1 = false
    @State private var mostrarSheet2 = false
    @State private var mostrarSheet3 = false
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                    Rectangle()
                        .fill(Color(red: 0.0039, green: 0.4078, blue: 0.5411))
                        .frame(height: geo.size.height / 3.5) // mitad de la pantalla
                        .edgesIgnoringSafeArea(.top)
            }
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
                mostrarSheet1=true
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
            .sheet(isPresented:$mostrarSheet1,content:{
                Text("Estos van a ser los terminos y condiciones")
                    .bold()
                Divider()
                Text("Aún no se tienen los términos y condiciones y estarán disponibles en la página lo más pronto posible")
                
                    .presentationDetents([.medium,.large])
            })

            Button(action: {
                mostrarSheet2=true
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
            .sheet(isPresented:$mostrarSheet2,content:{
                Text("Esta va a ser la ubicación")
                Image("mapa")
                    .presentationDetents([.medium,.large])
            })

            Button(action: {
                mostrarSheet3=true
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
            .sheet(isPresented:$mostrarSheet3,content:{
                Text("Teléfonos")
                    .font(.title)
                Text("81 8865 5600")
                Text("81 8865 5700")
                            
                Divider()
                            
                Text("Correos")
                    .font(.title)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Luis César González – lcgonzalezr@ternium.com.mx")
                    Text("Hernán Hernández – hhernandeza@novaservicios.com.mx")
                    Text("Sonia Álvarez – salvarez@novaservicios.com.mx")
                }
                    .presentationDetents([.medium,.large])
                    .padding()
            })
        }
        .frame(maxWidth: .infinity, alignment: .leading) // si los quieres pegados a la izquierda
        .padding(.horizontal, 24) // margen con los bordes
        .padding(.top, 16)
        

        }
    }//Cierre del view
    

struct FirstSheetView: View {
    var body: some View {
        VStack {
            Text("Este es el primer sheet")
                .font(.title)
            Button("Cerrar") {
                // se cierra automáticamente con swipe
            }
        }
        .padding()
    }
}

struct SecondSheetView: View {
    var body: some View {
        VStack {
            Text("Aquí se muestra el segundo sheet")
                .font(.title)
        }
        .padding()
    }
}

struct ThirdSheetView: View {
    var body: some View {
        VStack {
            Text("Este es el tercer sheet")
                .font(.title)
        }
        .padding()
    }
}

#Preview {
    Main()
}

