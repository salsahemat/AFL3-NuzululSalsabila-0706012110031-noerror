//
//  CategoryHome.swift
//  AFL3-NuzululSalsabila-0706012110031-noerror
//
//  Created by Nuzulul Salsabila on 27/04/23.
//

import SwiftUI

// shows the featured content in a navigation view
struct CategoryHome: View {
    //access an instance of ModelData
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            //Display the categories in Landmarks
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                //displays one of the featured landmarks
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    //pass category information to instances of the row type
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                //extend to the edges of the display
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

//preview provider for the CategoryHome view
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
        //pass data and state around
            .environmentObject(ModelData())
    }
}
