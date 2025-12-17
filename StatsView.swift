//
//  SwiftUIView.swift
//  MatchingAppThorsenGatundu
//
//  Created by JOSHUA GATUNDU on 12/10/25.
//

import SwiftUI
import SwiftData


struct StatsView: View {
    @AppStorage("wins") private var wins = 0

    var body: some View {
        VStack {
            Text("Stats")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.top)
            
            Spacer()
            Text("You have \(wins)")

            Spacer()
            
        }
    }
}


