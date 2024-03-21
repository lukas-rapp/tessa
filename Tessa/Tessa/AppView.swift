//
//  AppView.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import SwiftUI

struct AppView: View {
    
    @State var selection = ""
    
    var body: some View {
        NavigationSplitView(sidebar: {
            VStack(alignment: .leading, spacing: CGFloat(30.0)){
                HStack(spacing: CGFloat(20.0)){
                    Circle()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading){
                        Text("Herr Müller")
                            .font(.headline)
                        Text("Lehrer")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                
                VStack(alignment: .leading, spacing: CGFloat(20.0)){
                    NavigationLink(destination: {
                        OverviewView()
                    }, label: {
                        Label(
                            title: { Text("Übersicht") },
                            icon: { Image(systemName: "studentdesk") }
                        )
                    })
                    
                    NavigationLink(destination: {
                        StudentsView()
                    }, label: {
                        Label(
                            title: { Text("Schüler") },
                            icon: { Image(systemName: "figure.stand") }
                        )
                    })
                    NavigationLink(destination: {
                        TestsView()
                    }, label: {
                        Label(
                            title: { Text("Tests") },
                            icon: { Image(systemName: "newspaper") }
                        )
                    })
                    NavigationLink(destination: {
                        StatsView()
                    }, label: {
                        Label(
                            title: { Text("Statistics") },
                            icon: { Image(systemName: "chart.xyaxis.line") }
                        )
                    })
                }
            }
        }, detail: {
            
        })
    }
}

#Preview {
    AppView()
}
