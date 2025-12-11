//
//  File.swift
//  MatchingAppThorsenGatundu
//
//  Created by JOSHUA GATUNDU on 12/10/25.
//

import Foundation
import SwiftUI

class CardClass: Identifiable{
    let id = UUID()
   @State var picture: Image
    @State var back = Image("backOfPicture")
    
    init(picture: Image) {
        self.picture = picture
        self.back = back
    }
    
}
