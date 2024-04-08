//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Apptycoons on 08/04/2024.
//

import SwiftUI

struct InsetGalleryView: View {
    var animal : Animal
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                } //: LOOP
            } //: HSTACK
        } //: SCROLL
        
    }
}

struct InsetGalleryView_Preview : PreviewProvider{
    static var animalData : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View{
        InsetGalleryView(animal: animalData[1])
    }
}
