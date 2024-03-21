//
//  StudentsView.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import SwiftUI
import Charts

struct StudentsView: View {
    
    @State var students = ["Horst", "Heinrich", "Harald"]
    
    var body: some View {
        List {
            ForEach(students, id: \.self){ student in
                NavigationLink(destination: {
                    StudentDetailView()
                }, label: {
                    Section {
                        VStack{
                            HStack(spacing: CGFloat(20.0)){
                                Image("mueller")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    .shadow(radius: 10)
                                VStack(alignment: .leading){
                                    Text(student)
                                        .font(.headline)
                                    Text("Klasse 1a")
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
        
        /*Text("StudentsView")
            .font(.largeTitle)
            .fontWeight(.bold)
        Text("This is the student page")
            .font(.subheadline)
            .foregroundStyle(.gray)*/
    }
}

struct StudentCell: View {
    @Binding var student: Student
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(student.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Klasse 1a")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            Spacer()
            VStack{
                Chart {
                    BarMark(
                        x: .value("Shape Type", 10),
                        y: .value("Total Count", 10)
                    )
                    BarMark(
                         x: .value("Shape Type", 20),
                         y: .value("Total Count", 20)
                    )
                    BarMark(
                         x: .value("Shape Type", 20),
                         y: .value("Total Count", 20)
                    )
                }
                .frame(width: 150, height: 100)
                Text("Performance")
            }
        }
        
    }
}

#Preview {
    StudentsView()
}
