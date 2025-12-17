//
//  SwiftUIView.swift
//  MatchingAppThorsenGatundu
//
//  Created by JOSHUA GATUNDU on 12/14/25.
//

import SwiftUI

struct WinView: View {
    @AppStorage("wins") private var wins = 0
    @State var yes = false
    var body: some View {
            VStack{
                Text("You win")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("You now have \(wins) wins")
               
                
            }
            .toolbar(.hidden, for: .tabBar)
        
    }
}

