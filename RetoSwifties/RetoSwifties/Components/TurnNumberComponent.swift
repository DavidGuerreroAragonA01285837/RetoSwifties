//
//  TurnNumberComponent.swift
//  RetoSwifties
//
//  Created by Alumno on 27/08/25.
//

import SwiftUI

struct TurnNumberComponent: View {
    @State public var numeroTurno: Int = 123
    @State public var size: Float = 190
    @State public var fontSize: Float = 60
    var body: some View {
        ZStack{
            Circle()
                .frame(width: CGFloat(size))
                .padding(.top, 5)
                .foregroundStyle(Color(red: 255/255, green: 153/255, blue: 0, opacity: 0.7))
            Text(String(numeroTurno))
                .font(.system(size: CGFloat(fontSize), weight: .bold))
                .foregroundStyle(Color(red:102/255, green: 102/255, blue: 102/255))
        }
    }
}

#Preview {
    TurnNumberComponent()
}
