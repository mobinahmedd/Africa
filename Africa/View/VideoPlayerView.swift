//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Apptycoons on 08/04/2024.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    // MARK: - PROPERTIES
    
    var videoSelected: String
    var videoTitle: String
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
                .overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                    , alignment: .topLeading
                )
        }//: VSTACK
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }//: BODY
}

// MARK: - PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "cheetah", videoTitle: "Cheetah")
        }
    }
}
