//
//  MapView.swift
//  AFL3-NuzululSalsabila-0706012110031-noerror
//
//  Created by Nuzulul Salsabila on 27/04/23.
//

import SwiftUI
import MapKit

//Define mapview to show maps
struct MapView: View {
    //save coordinate geographis
    var coordinate: CLLocationCoordinate2D
    
    //takes on the medium zoom level by default
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    //characterize the zoom level
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            return self
        }
    }
    
    //construct the region property to a value that depends on zoom
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    var body: some View {
        //reference to state private var region
        Map(coordinateRegion: .constant(region))
    }
    //method that updates the region based on a coordinate value
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        //update the preview provider to pass a fixed coordinate
        MapView(coordinate:CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
