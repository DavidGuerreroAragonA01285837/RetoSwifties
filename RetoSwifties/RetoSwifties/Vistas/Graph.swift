import SwiftUI
import Charts

struct Graph: View {
    @StateObject var viewModel = TurnViewModel()  // your ViewModel with hourTotals

    // Lista de horas (etiquetas)
    let hours = [
        "12 AM","1 AM","2 AM","3 AM","4 AM","5 AM","6 AM",
        "7 AM","8 AM","9 AM","10 AM","11 AM","12 PM",
        "1 PM","2 PM","3 PM","4 PM","5 PM","6 PM",
        "7 PM","8 PM","9 PM","10 PM","11 PM"
    ]
    
    // Computamos las 3 peores horas
    var worstHours: [(String, Int)] {
        let pairs = Array(zip(hours, viewModel.hourTotals))
        return pairs.sorted(by: { $0.1 > $1.1 })   // Sort descending by total
                    .prefix(3)                     // Take top 3
                    .map { $0 }                     // Convert SubSequence back to array
    }

    
    var body: some View {
        VStack {
            Text("Saturación por Hora")
                .font(.title)
                .bold()
                .foregroundColor(Color(red: 242/255, green: 242/255, blue: 242/255))
            
            Chart {
                ForEach(Array(zip(hours, viewModel.hourTotals)), id: \.0) { hour, value in
                    BarMark(
                        x: .value("Hora", hour),
                        y: .value("Saturación", value)
                    )
                    .foregroundStyle(Color(red: 1 , green: 0.6, blue: 0))
                }
            }
            .chartXAxis {
                AxisMarks(values: hours) { hour in
                    AxisValueLabel()
                    AxisTick()
                    AxisGridLine()
                }
            }
            .frame(height: 250)
            .padding(.vertical, 5)

            Text("Horas más llenas:")
                .font(.headline)

            HStack {
                ForEach(worstHours, id: \.0) { hour, _ in
                    Text(hour)
                        .foregroundColor(Color(red: 242/255, green: 242/255, blue: 242/255))
                }
            }

        }
        .onAppear {
            viewModel.fetchHourTotals()  // Fetch the data when the view appears
            
        }
    }
}
