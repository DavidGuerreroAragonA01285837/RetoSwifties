//
//  ConfirmacionTurnoView.swift
//  RetoSwifties
//
//  Created by Alumno on 27/08/25.
//

import SwiftUI

struct ConfirmacionTurnoView: View {
    @Environment(\.dismiss) private var dismiss
    @State public var folio: String = "XXXXXX"
    @State public var numeroTurno: Int = 123
    @State public var turnoActual: Int = 110
    var body: some View {
        VStack(){
            Text("¡Turno Confirmado!")
                .font(.system(size: 35, weight: .bold))
                .frame(width: 350, height: 48)
                .background(Color(red: 1/255, green: 104/255, blue: 138/255))
                .foregroundStyle(Color.white)
                .cornerRadius(10)
                .padding(.vertical, 25)
            TurnNumberComponent(numeroTurno: numeroTurno)
                .padding(.top, 15)
            HStack{
                Text("Folio")
                    .font(.system(size: 30, weight: .bold))
                    .frame(width: 120)
                    .foregroundStyle(Color(red:102/255, green: 102/255, blue: 102/255))
                    .background(Color(red: 211/255, green: 211/255, blue: 211/255))
                    .cornerRadius(10)
                Spacer()
                Text(folio)
                    .font(.system(size: 35, weight: .bold))
            }
            .frame(width: 310)
            .padding(.vertical, 30)
            .padding(.horizontal, 40)
            
            HStack{
                Text("Atendiendo turno:")
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 200)
                    .foregroundStyle(Color(red:102/255, green: 102/255, blue: 102/255))
                    .background(Color(red: 211/255, green: 211/255, blue: 211/255))
                    .cornerRadius(10)
                Spacer()
                Text(String(turnoActual))
                    .font(.system(size: 35, weight: .bold))
            }
            .frame(width: 310)
            .padding(.vertical, 30)
            .padding(.horizontal, 40)
            
            Text("Recuerda traer receta")
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(Color(red: 1, green: 153/255, blue: 0))
                .padding(.top, 30)
            
            
            Spacer()
            Button{
                dismiss()
            }label:{
                Text("Cancelar")
                    .frame(width: 290, height: 30)
                    .font(.system(size: 21, weight: .bold))
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.red)
            .padding(.bottom, 13)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 242/255, green: 242/255, blue: 242/255))
    }
}

#Preview {
    ConfirmacionTurnoView()
}
