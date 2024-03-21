//
//  StudentsView.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import SwiftUI
import Charts

struct StudentsView: View {
    
    @State var students = [Student(name: "Horst"), Student(name: "Hans"), Student(name: "Heinrich")]
    
    var body: some View {
        List {
            ForEach($students, id: \.name) { student in
                StudentCell(student: student)
            }
        }
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
