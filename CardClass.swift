//
//  File.swift
//  MatchingAppThorsenGatundu
//
//  Created by JOSHUA GATUNDU on 12/10/25.
//

import SwiftUI

struct CardClass: Identifiable {

    let id = UUID()
    var name: String
    var picture: Image
    var back: Image = Image("backofpicture")
    var isFaceUp: Bool = false

    init(name: String) {
        self.name = name
        self.picture = Image(name)
    }
}

