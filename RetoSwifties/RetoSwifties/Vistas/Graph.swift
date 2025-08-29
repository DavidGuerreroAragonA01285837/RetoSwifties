//
//  Graph.swift
//  RetoSwifties
//
//  Created by Alumno on 27/08/25.
//

import SwiftUI
import Charts

struct Graph: View {
    // Lista de horas (etiquetas)
    let hours = [
        "1 AM","2 AM","3 AM","4 AM","5 AM","6 AM",
        "7 AM","8 AM","9 AM","10 AM","11 AM","12 PM",
        "1 PM","2 PM","3 PM","4 PM","5 PM","6 PM",
        "7 PM","8 PM","9 PM","10 PM","11 PM","12 AM"
    ]
    
    // Lista de saturaciones (mismos índices que las horas)
    @State var values: [Int] = [
        20, 40, 35, 50, 70, 65,
        30, 25, 80, 55, 60, 45,
        50, 75, 40, 35, 60, 90,
        65, 30, 25, 20, 15, 99
    ]
    
    // Computamos las 3 peores horas
    var worstHours: [(String, Int)] {
        let pairs = Array(zip(hours, values))
        return pairs.sorted(by: { $0.1 > $1.1 }).prefix(3).map { $0 }
    }
    
    var body: some View {
        VStack {
            Text("Saturación por Hora")
                .font(.title)
                .bold(true)
                .foregroundColor(Color(red: 242/255, green: 242/255, blue: 242/255))
            
            Chart {
                ForEach(Array(zip(hours, values)), id: \.0) { hour, value in
                    BarMark(
                        x: .value("Hora", hour),
                        y: .value("Saturación", value)
                    )
                    .foregroundStyle(Color(red: 1 , green: 0.6, blue: 0))
                }
            }
            .chartXAxis {
                AxisMarks(values: hours) { hour in  // forzamos que las horas se usen como categorías
                    AxisValueLabel()               // muestra la etiqueta
                    AxisTick()
                    AxisGridLine()
                }
            }
            .frame(height: 250)
            .padding()

            .padding(.vertical, 5)
            Text("Horas mas llenas:")
                .font(.headline)
            HStack{
                ForEach(worstHours, id: \.0) { hour, value in
                    Text("\(hour)")
                        .foregroundColor(Color(red: 242/255, green: 242/255, blue: 242/255))
                }
            }
        }
    }
}


#Preview {
    Graph()
}
