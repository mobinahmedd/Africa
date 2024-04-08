//
//  VideoListItemView.swift
//  Africa
//
//  Created by Apptycoons on 08/04/2024.
//

import SwiftUI

struct VideoListItemView: View {
    
    // MARK: - PROPERTIES
    
    let video: Video
    
    // MARK: - BODY

    var body: some View {
        Text("Hello, World!")
    }
}

// MARK: - PREVIEW

struct VideoListItem_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
