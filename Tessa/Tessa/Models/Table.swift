//
//  Table.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import Foundation
import SwiftUI
import SwiftData

enum TableType {
    case single
    case double
    case quadruple
}

struct Table: View, Identifiable{
    public var id: UUID
    @State var position: CGPoint
    @State var tabletype: TableType
    @State var angle: Angle

    @GestureState private var dragState: CGSize = CGSize.zero
    
    
    init(id: UUID = UUID(), position: CGPoint) {
        self.id = id
        self.position = position
        self.tabletype = .double
        self.angle = Angle(degrees: 0)
    }
    
    var body: some View {
        switch tabletype {
        case .single:
            ZStack {
                Image("table_single")
                    .resizable()
                    .frame(width: 250, height: 100)
                TableStudent(student: nil)
                    .onTapGesture {
                        print("Right")
                    }
            }
            .onTapGesture {
                self.tabletype = .double
            }
            .position(position)
        case .double:
            ZStack {
                Image("table_double")
                    .resizable()
                    .frame(width: 250, height: 100)
                TableStudent(student: nil)
                    .offset(x: 60)
                    .onTapGesture {
                        print("Right")
                    }
                TableStudent(student: nil)
                    .offset(x: -60)
                    .onTapGesture {
                        print("Left")
                    }
            }
            .rotationEffect(angle)
            .gesture(DragGesture(minimumDistance: 5)
                .updating($dragState) { drag, state, _ in
                    state = drag.translation
                }
                .onChanged {
                    self.position = $0.location
                    //self.position(x: $0.location.x, y: $0.location.y)
                    print($0.location)
                }
                .onEnded {
                    self.position = CGPoint(x: $0.location.x.roundedToNearest100(), y: $0.location.y.roundedToNearest100())
                    //self.position(x: $0.location.x.roundedToNearest100(), y: $0.location.y.roundedToNearest100())
                }
            )
            .onTapGesture {
                tabletype = .quadruple
            }
            .gesture(RotateGesture()
                .onChanged { value in
                    angle = value.rotation
                })
            
            .position(position)
        case .quadruple:
            ZStack {
                Image("table_quad")
                    .resizable()
                    .frame(width: 250, height: 200)
                TableStudent(student: nil)
                    .offset(x: 60, y: -35)
                    .onTapGesture {
                        print("Right")
                    }
                TableStudent(student: nil)
                    .offset(x: -60, y: -35)
                    .onTapGesture {
                        print("Left")
                    }
                TableStudent(student: nil)
                    .offset(x: -60, y: 40)
                    .onTapGesture {
                        print("Left")
                    }
                TableStudent(student: nil)
                    .offset(x: 60, y: 40)
                    .onTapGesture {
                        print("Left")
                    }
            }
            .onTapGesture {
                tabletype = .single
            }
            .rotationEffect(angle)
            .gesture(RotateGesture()
                .onChanged { value in
                    angle = value.rotation
                })
            .position(position)
        }
        
    }
}

struct TableStudent: View{
    
    public var id: UUID
    public var student: Student?
    
    init(id: UUID = UUID(), student: Student?) {
        self.id = id
        self.student = student
    }
    
    var body: some View {
        Group{
            NavigationLink(destination: {
                StudentDetailView()
            }, label: {
                Image("mueller")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            })
            
        }
    }
}
