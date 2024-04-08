//
//  GalleryView.swift
//  Africa
//
//  Created by Apptycoons on 05/04/2024.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var selectedAnimal : String = "lion"
    
    // let gridLayout : [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    
    // Efficient grid Definition
    // let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Double = 3.0
    
    // MARK: - FUNCTIONS
    func gridSwitch(){
        withAnimation(.easeIn){
            gridLayout=Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            
            VStack(alignment: .center,spacing: 30) {
                // MARK: IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 8))
                
                // MARK: SLIDER
                Slider(value: $gridColumn, in: 2...4 , step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn){
                        gridSwitch()
                    }
                
                // MARK: GRID
                LazyVGrid(columns: gridLayout,alignment: .center,spacing: 10){
                    ForEach(animals){animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2.0))
                            .onTapGesture {
                                withAnimation(.easeOut(duration: 0.5)){
                                    selectedAnimal = animal.image
                                    haptics.impactOccurred()
                                }
                            }
                    }
                }//: GRID
                .onAppear(){
                    gridSwitch()
                }
            }//: VStack
            .padding(.vertical, 50)
            .padding(.horizontal, 10)
        }//: Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())    }
}

// MARK: - PREVIEW
#Preview {
    GalleryView()
}
