//
//  StatsView.swift
//  Tessa
//
//  Created by Lukas Rapp on 21.03.24.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        Text("StatView")
            .font(.largeTitle)
            .fontWeight(.bold)
        Text("This is the Statistics page")
            .font(.subheadline)
            .foregroundStyle(.gray)
    }
}

#Preview {
    StatsView()
}
