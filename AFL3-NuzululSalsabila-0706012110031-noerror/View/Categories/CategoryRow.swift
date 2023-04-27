//
//  CategoryRow.swift
//  AFL3-NuzululSalsabila-0706012110031-noerror
//
//  Created by Nuzulul Salsabila on 27/04/23.
//

import SwiftUI

//represents a row of landmarks organized by category
struct CategoryRow: View {
    var categoryName: String //representing the name of the category
    var items: [Landmark]
    //body of the CategoryRow view
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            //displays a CategoryItem view for each Landmark item in the items array
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            
            //modifier sets the height of the ScrollView to 185 points
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    //initialize the categoryName and items arguments of the CategoryRow view
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        CategoryRow(
            //to see how the view will look with specific categoryName and items values
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
