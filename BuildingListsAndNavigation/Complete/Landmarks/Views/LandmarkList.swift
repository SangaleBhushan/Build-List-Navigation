/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData

    @State private var showFavoritesOnly = false
    
    var filteredLandmark : [Landmark]{
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text( "Show Favorites")
                }
                ForEach( filteredLandmark) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        } detail: {
            Text("Select a Landmark")
        }
//        Button(action: {
//            showFavoritesOnly.toggle()
//        }, label: {
//            Text("\(showFavoritesOnly ? "Show All" :"Show Favorites")")
//        })
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
    
}
