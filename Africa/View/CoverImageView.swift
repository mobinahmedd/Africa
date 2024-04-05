//
//  CoverImageView.swift
//  Africa
//
//  Created by Apptycoons on 05/04/2024.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    let coverImages : [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: - BODY
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
                    .padding(0)
            }//: FOREACH
        }//: TABVIEW
        .tabViewStyle(PageTabViewStyle())
        .padding(0)
    }
}

// MARK: - PREVIEW
#Preview {
    CoverImageView()
}
