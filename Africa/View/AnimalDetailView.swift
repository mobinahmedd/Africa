//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Apptycoons on 05/04/2024.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - PROPERTIES
    let animal : Animal
    
    // MARK: - BODY
    var body: some View {
        NavigationStack{
            VStack{
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // NAME
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                
                Spacer()
            }
            .navigationBarTitle("Learn about \(animal.name)",displayMode: .inline)
        }//: NAVIGATION STACK
    }
}

// MARK: - PREVIEW
struct AnimalDetailView_Preview : PreviewProvider{
    static var animalData : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View{
        AnimalDetailView(animal: animalData[1])
    }
}

