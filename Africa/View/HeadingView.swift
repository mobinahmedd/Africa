//
//  HeadingView.swift
//  Africa
//
//  Created by Apptycoons on 05/04/2024.
//

import SwiftUI

struct HeadingView: View {
    
    let text : String
    let icon : String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(text)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
        
    }
}

#Preview {
    HeadingView(text: "Heading", icon: "apps.iphone")
}
