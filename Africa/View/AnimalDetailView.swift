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
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
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
                
                // GALLERY
                Group{
                    HeadingView(text: "Wilderness in Pictures", icon: "photo.on.rectangle.angled")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)

                
                // FACT
                Group{
                    HeadingView(text: "Did you know?", icon: "questionmark.circle")
                    
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)

                
                // DESCRIPTION
                Group{
                    HeadingView(text: "All about \(animal.name)", icon: "info.circle")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                // MAP
                Group{
                    HeadingView(text: "National Park", icon: "map")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                // LINK
                Group{
                    HeadingView(text: "Learn More", icon: "books.vertical")
                    
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)

                
            }//:VStack
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }//: Scroll View
    
    }
}

// MARK: - PREVIEW
struct AnimalDetailView_Preview : PreviewProvider{
    static var animalData : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View{
        AnimalDetailView(animal: animalData[0])
    }
}

