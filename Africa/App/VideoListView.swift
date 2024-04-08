//
//  VideoListView.swift
//  Africa
//
//  Created by Apptycoons on 05/04/2024.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    @State var videos : [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - BODY
    var body: some View {
        NavigationStack{
            List{
                ForEach(videos){video in
                    NavigationLink(destination: {
                        VideoPlayerView(videoSelected: video.id, videoTitle: video.name)
                    }, label: {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    })
                    
                }//: LOOP
            }//: LIST
            .scrollIndicators(.hidden)
            .padding(.top, -25)
            .navigationBarTitle("Videos", displayMode: .inline)
            .listStyle(InsetGroupedListStyle())
            .navigationBarItems(
                trailing:
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName : "arrow.2.squarepath")
                    })
            )
        }
    }
}

// MARK: - PREVIEW
#Preview {
    VideoListView()
}
