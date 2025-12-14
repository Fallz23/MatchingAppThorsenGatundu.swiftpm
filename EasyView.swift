//
//  SwiftUIView.swift
//  MatchingAppThorsenGatundu
//
//  Created by JOSHUA GATUNDU on 12/10/25.
//

import SwiftUI
import SwiftData



struct EasyView: View {
    
    @State var win = false
    @Binding var pictures: [CardClass]
    @State var selectedPic: CardClass? = nil
    @State var selectedPic2: CardClass? = nil
    var body: some View {
        NavigationStack{
            VStack {
                ForEach(0..<pictures.count/3+1, id: \.self) { row in
                    HStack {
                        ForEach(0..<3) { column in
                            let index = row * 3 + column
                            if index < pictures.count {
                                Button{
                                    if selectedPic == nil{
                                        selectedPic = pictures[index]
                                    } else if selectedPic2 == nil{
                                        selectedPic2 = pictures[index]
                                    }
                                    
                                    if selectedPic == selectedPic2 {
                                        pictures.removeAll() { pic in
                                            pic.id == selectedPic!.id || pic.id == selectedPic2!.id
                                            
                                        }
                                        selectedPic = nil
                                        selectedPic2 = nil
                                        if pictures.count == 0{
                                            win = true
                                        }
                                    }
                                } label: {  pictures[index].picture
                                    
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                }
                            } else {
                                Spacer()
                            }
                        }
                    }
                }
                
                Text("Easy mode")
                Spacer()
                
                
                
                ForEach(0..<pictures.count/3+1, id: \.self) { row in
                    HStack {
                        ForEach(0..<3) { column in
                            let index = row * 3 + column
                            if index < pictures.count {
                                Button{
                                    if selectedPic == nil{
                                        selectedPic = pictures[index]
                                    } else if selectedPic2 == nil{
                                        selectedPic2 = pictures[index]
                                        
                                        
                                        
                                        
                                        
                                        if selectedPic == selectedPic2 {
                                            pictures.removeAll() { pic in
                                                pic.id == selectedPic!.id || pic.id == selectedPic2!.id
                                                
                                            }
                                            
                                            selectedPic = nil
                                            selectedPic2 = nil
                                            if pictures.count == 0{
                                                win = true
                                            }
                                        }
                                    }
                                    
                                    
                                } label: {  pictures[index].picture
                                    
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                }
                            } else {
                                Spacer()
                            }
                        }
                    }
                }
                
                Text("Easy mode")
                Spacer()
                
            }
            
            .toolbar(.hidden, for: .tabBar)
            .navigationDestination(isPresented: $win){
                WinView()
            }
        }
    }
        
}
