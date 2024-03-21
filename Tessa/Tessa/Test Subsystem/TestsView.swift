//
//  TestsView.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import SwiftUI

struct TestsView: View {
    
    @State var tests = ["Mathe", "Deutsch"]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(tests, id: \.self){ test in
                    NavigationLink(destination: {
                        StudentDetailView()
                    }, label: {
                        Section {
                            VStack{
                                HStack(spacing: CGFloat(20.0)){
                                    Image(systemName: "book.pages")
                                        .resizable()
                                        .background(.blue)
                                        .foregroundStyle(.white)
                                        .frame(width: 50, height: 50)
                                        .scaledToFit()
                                        .clipShape(Circle())
                                    VStack(alignment: .leading){
                                        Text(test)
                                            .font(.headline)
                                        Text("geschrieben am 21.3.2024")
                                            .font(.subheadline)
                                            .foregroundStyle(.gray)
                                    }
                                    .padding()
                                }
                            }
                        }
                    })
                }
            }
            .toolbar {
                  Button(role: .destructive, action: {
                  }) {
                      Label("Settings", systemImage: "plus").foregroundStyle(.primary)
                  }
               }
        }
    }
}

#Preview {
    TestsView()
}
