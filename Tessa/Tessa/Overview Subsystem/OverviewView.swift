//
//  OverviewView.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import SwiftUI

struct OverviewView: View {
    var body: some View {
        Text("Overview")
            .font(.largeTitle)
            .fontWeight(.bold)
        Text("This is the overview page")
            .font(.subheadline)
            .foregroundStyle(.gray)
    }
}

#Preview {
    OverviewView()
}
