//
//  SwiftUIView.swift
//  MatchingAppThorsenGatundu
//
//  Created by JOSHUA GATUNDU on 12/10/25.
//

import SwiftUI
import SwiftData



struct EasyView: View {
    @Binding var pictures: [CardClass]

    var body: some View {
        VStack {
            ForEach(0..<pictures.count/3 + 1, id: \.self) { row in
                HStack {
                    ForEach(0..<3) { column in
                        let index = row * 3 + column
                        if index < pictures.count {
                            pictures[index].picture
                                .resizable()
                                .frame(width: 100, height: 100)
                        } else {
                            Spacer()
                        }
                    }
                }
            }

            Text("Easy mode")
            Spacer()
        }
    }
}
