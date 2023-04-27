//
//  LandmarkDetail.swift
//  AFL3-NuzululSalsabila-0706012110031-noerror
//
//  Created by Nuzulul Salsabila on 27/04/23.
//

import SwiftUI

//define landmarkdetail to show detail in landmark
struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    //compute the index of the input landmark by comparing it with the model data
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
            //to extend to the top edge of the screen
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
            // moving the image upwards
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                Text(landmark.name)
                    .font(.title)
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
        }
        //give the navigation bar a title
        .navigationTitle(landmark.name)
        //make the title appear inline
        .navigationBarTitleDisplayMode(.inline)
    }
}

//define LandmarkDetail_Previews to show landmark detail
struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
