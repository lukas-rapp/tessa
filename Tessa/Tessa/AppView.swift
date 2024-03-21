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
            VStack(alignment: .center){
                VStack(alignment: .leading, spacing: CGFloat(20.0)){
                    HStack(alignment: .center ,spacing: CGFloat(20.0)){
                        Group{
                            Image("mueller")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFill()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                        }
                        .padding(.leading, 30)
                        VStack(alignment: .leading){
                            Text("Herr Müller")
                                .font(.headline)
                            Text("Lehrer")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    
                    VStack(alignment: .leading, spacing: CGFloat(20.0)){
                        List {
                            NavigationLink(destination: {
                                TableTest()
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
                }
                Spacer()
            }
        }, detail: {
            ClassPicker()
        })
    }
}

#Preview {
    AppView()
}
