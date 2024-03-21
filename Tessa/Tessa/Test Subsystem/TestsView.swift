//
//  TestsView.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import SwiftUI

struct TestsView: View {
    var body: some View {
        Text("TestView")
            .font(.largeTitle)
            .fontWeight(.bold)
        Text("This is the test page")
            .font(.subheadline)
            .foregroundStyle(.gray)
    }
}

#Preview {
    TestsView()
}
