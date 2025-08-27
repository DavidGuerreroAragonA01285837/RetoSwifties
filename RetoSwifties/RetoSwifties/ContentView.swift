//
//  ContentView.swift
//  RetoSwifties
//
//  Created by Alumno on 21/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                    InicioView()
                    .tabItem{
                    Label("Inicio", systemImage: "house.circle")
                    }
                    Graph()
                    .tabItem{
                        Label("Graficas", systemImage: "chart.bar")
                    }
            }.tint(Color(red: 1, green: 153/255, blue: 0))
        }
        .padding()
    }
    
    
}
#Preview {
    ContentView()
}
