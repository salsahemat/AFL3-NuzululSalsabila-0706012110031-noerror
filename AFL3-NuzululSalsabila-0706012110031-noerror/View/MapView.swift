//
//  MapView.swift
//  AFL3-NuzululSalsabila-0706012110031-noerror
//
//  Created by Nuzulul Salsabila on 27/04/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    //holds the region information for the map
    @State private var region = MKCoordinateRegion()
    
    
    //takes a binding to the region
    var body: some View {
        Map(coordinateRegion: $region)
        //calculated the region based on current coordinate
            .onAppear {
                setRegion(coordinate)
            }
    }
    //updates the region based on a coordinate value
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        //pass a fixed coordinate
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
