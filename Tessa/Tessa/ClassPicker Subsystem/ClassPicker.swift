//
//  ClassPicker.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import SwiftUI

struct ClassPicker: View {
    
    @State var classes = ["1a", "1b", "2a", "2b", "3a"]
    
    var body: some View {
        HStack{
            ForEach($classes, id: \.self) { classname in
                ClassView(classname: classname)
            }
        }
    }
}

struct ClassView: View {
    @Binding var classname: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .frame(width: 125, height: 125)
                .foregroundStyle(.red)
            Text(classname)
                .font(Font.system(size: CGFloat(30.0)))
                .fontWeight(.heavy)
                .foregroundStyle(.background)
        }
        
    }
}

#Preview {
    ClassPicker()
    //ClassView(classname: .constant("3b"))
}
