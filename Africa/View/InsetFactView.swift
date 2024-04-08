//
//  InsetFactView.swift
//  Africa
//
//  Created by Apptycoons on 08/04/2024.
//

import SwiftUI

struct InsetFactView: View {
    var animal : Animal
    
    var body: some View {
        
        ZStack {
            Color(.secondarySystemBackground)
            TabView{
                ForEach(animal.fact, id:\.self){fact in
                    Text(fact)
                        .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .frame(height: 180)
        .cornerRadius(12)
    }
}


struct InsetFactView_Preview : PreviewProvider{
    
    static var animalData : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View{
        InsetFactView(animal: animalData[1])
    }
}
