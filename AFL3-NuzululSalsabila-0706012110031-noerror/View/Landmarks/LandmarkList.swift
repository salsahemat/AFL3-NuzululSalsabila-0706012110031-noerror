//
//  LandmarkList.swift
//  AFL3-NuzululSalsabila-0706012110031-noerror
//
//  Created by Nuzulul Salsabila on 27/04/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    //called  showFavoritesOnly set to false to see how the list reacts
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    //set the selectedLandmark
    @State private var selectedLandmark: Landmark?
    
    //describe filter states
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    //checking the showFavoritesOnly property and each landmark
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    //Returns a string that is used as the title for the navigation bar in the LandmarkList view
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    //Returns the index of the selectedLandmark in the modelData.landmarks array
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    
    var body: some View {
        //navigation stack is the new navigation list
        NavigationStack{
            //creates one LandmarkRow for each element in the landmarks array
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    //associates a particular landmark in the ForEach
                    .tag(landmark)
                }
            }
            .navigationTitle(title)
            //ensures that the list never becomes too small
            .frame(minWidth: 300)
            //containing a Menu inside a new toolbar modifier
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        //passing a binding to showFavoritesOnly
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            //placeholder for the second view in wide layouts
            Text("Select a Landmark")
        }
        //providing a binding the value from the landmarks array
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}

