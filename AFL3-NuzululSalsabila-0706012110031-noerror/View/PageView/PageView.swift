//
//  PageView.swift
//  AFL3-NuzululSalsabila-0706012110031-noerror
//
//  Created by Nuzulul Salsabila on 28/04/23.
//

import SwiftUI

//declare PageViewController as a child view
struct PageView<Page: View>: View {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}


struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        //pass the required array of views
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
