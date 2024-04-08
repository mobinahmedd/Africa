//
//  ContentView.swift
//  Africa
//
//  Created by Apptycoons on 05/04/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: _ PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // MARK: _ BODY
    var body: some View {
        NavigationStack(){
            List{
                
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top:0, leading: 0,bottom: 0, trailing: 0))
                
                Group{
                    ForEach(animals){animal in
                        NavigationLink(destination: AnimalDetailView(animal: animal)) {
                            AnimalListItemView(animal: animal)
                        } //: LINK
                    }//: LOOP
                }//: GROUP
                
                
            }//: List
            .navigationBarTitle("Africa", displayMode: .large)
            .listStyle(PlainListStyle()) // Makes it look like scroll view
            .scrollIndicators(.hidden)
        }//: NAVIGATION STACK
    }
}

// MARK: _ PREVIEW
#Preview {
    ContentView()
}
