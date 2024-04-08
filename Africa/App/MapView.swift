//
//  MapView.swift
//  Africa
//
//  Created by Apptycoons on 05/04/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    
    @State private var region : MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations :  [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    var body: some View {
        // MARK - 1. BASIC MAP
        //        Map(initialPosition: MapCameraPosition.region(region))
        
        // MARK - 2. MAP WITH ANNOTATIONS
        Map(coordinateRegion: $region,
            annotationItems:locations,
            annotationContent:{item in
            // (A) PIN: OLD STYLE (always static)
            //            MapPin(coordinate: item.location,tint: .accentColor)
            
            // (B) MAPMARKER: NEW STYLE (always dynamic)
            //            MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: item.location, content: {
                //                Image(item.image)
                //                    .resizable()
                //                    .scaledToFit()
                //                    .frame(width: 32,height: 32)
                //                    .cornerRadius(12)
                MapAnnotationView(location: item)
            }
            )//: Map Annotation
        }
        )//: MAP
        .overlay(
            HStack(alignment: .center,spacing: 12) {

                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48,height: 48,alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
                
            }//: HSTACK
            .padding(.vertical,12)
            .padding(.horizontal,16)
            .background(Color.black.cornerRadius(8).opacity(0.6))
            .padding()
            ,alignment : .top
        )
    }//: BODY
}

// MARK: - PREVIEW
#Preview {
    MapView()
}
