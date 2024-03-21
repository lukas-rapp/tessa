//
//  TableTest.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import SwiftUI

extension CGPoint: Identifiable { // just a helper for demo
    public var id: String { "\(x)-\(y)" }
}

extension CGFloat {
    func roundedToNearest100() -> CGFloat {
        return (self / 100).rounded(.up) * 100
    }
}

extension CGFloat {
    func snapToOtherY(guides: [CGPoint]) -> CGFloat {
        for guidePoint in guides {
            if self <= guidePoint.y + 10{
                return guidePoint.y
            }
        }
        return self
    }
}

struct TableTest: View {
    @State private var points: [CGPoint] = [] // << persistent
    @State private var point: CGPoint?    // << current
    @State private var angle = Angle(degrees: 0.0)
    
    @State private var guidesY: [CGPoint] = []
    
    @State private var tables: [Table] = []
    
    @GestureState private var dragState: CGSize = CGSize.zero


    var body: some View {
        Color.clear.overlay(        // << area
            Group {
                ForEach(tables) { table in // << stored `items`
                    table
                        
                }
                if let curr = point {  // << active `item`
                    Rectangle().fill(Color.gray)
                        .opacity(0.4)
                        .blur(radius: 5.0)
                        .frame(width: 160, height: 80)
                        .position(curr)
                        //.position(x: curr.x.roundedToNearest100(), y: curr.y.roundedToNearest100())
                }
            }
        )
        .contentShape(Rectangle()) // << make area tappable
        .onTapGesture { location in
            tables.append(Table(position: CGPoint(x: location.x.roundedToNearest100(), y: location.y.roundedToNearest100())))
        }
        /*.gesture(DragGesture(minimumDistance: 0.0)
            .updating($dragState) { drag, state, _ in
                state = drag.translation
                
            }
            .onChanged {
                point = $0.location
                
            }
            .onEnded {
                tables.append(Table(position: CGPoint(x: $0.location.x.roundedToNearest100(), y: $0.location.y.roundedToNearest100())))
                point = nil
                
            }
        )*/
    }
}

#Preview {
    TableTest()
}
