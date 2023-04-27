//
//  CircleImage.swift
//  AFL3-NuzululSalsabila-0706012110031-noerror
//
//  Created by Nuzulul Salsabila on 27/04/23.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
        //apply the circular clipping shape to the image
            .clipShape(Circle())
        //give the image a border
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
