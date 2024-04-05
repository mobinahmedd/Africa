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
        NavigationStack{
            List{
                
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top:0, leading: 0,bottom: 0, trailing: 0))
                
                Group{
                    ForEach(animals){animal in
                        AnimalListItemView(animal : animal)
                    }
                }//: GROUP
                
                
            }//: List
            .navigationBarTitle("Africa", displayMode: .large)
        }//: NAVIGATION STACK
    }
}

// MARK: _ PREVIEW
#Preview {
    ContentView()
}
