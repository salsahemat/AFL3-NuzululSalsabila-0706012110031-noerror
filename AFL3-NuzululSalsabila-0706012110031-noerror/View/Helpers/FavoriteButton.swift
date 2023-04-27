//
//  FavoriteButton.swift
//  AFL3-NuzululSalsabila-0706012110031-noerror
//
//  Created by Nuzulul Salsabila on 27/04/23.
//

import SwiftUI

struct FavoriteButton: View {
    //isSet binding that indicates the button’s current state
    @Binding var isSet: Bool
    var body: some View {
        //changes its appearance based on the state
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        //provide a constant value for the preview
        FavoriteButton(isSet: .constant(true))
    }
}
