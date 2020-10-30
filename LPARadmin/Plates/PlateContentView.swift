//
//  PlateContentView.swift
//  LPAR
//
//  Created by Allan Hull on 3/6/20.
//  Copyright © 2020 Allan Hull. All rights reserved.
//

import Foundation
import SwiftUI

let platesEndpoint = "https://lpar.mobi/api/v1/plates"

struct Plate: Codable, Identifiable {
    public var id: Int
//    let identifier: String
    let state: String
    let name: String
    let description: String
    let year: String
    let cost: String
    let category: String
    let imageLink: String
//    let infolink: String
    let latitude: String
    let longitude: String
//    let created_at: String
//    let updated_at: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case state = "state"
        case description = "description"
        case year = "year"
        case cost = "cost"
        case category = "category"
//        case infolink = "infolink"
        case imageLink = "imageLink"
        case latitude = "latitude"
        case longitude = "longitude"
        case name = "name"
      
        
    }
    
}

typealias Plates = [Plate]



struct PlateContentView: View {

    @ObservedObject var plateData: PlateDownloader = PlateDownloader()
    
    var usstate: usState
      
    var body: some View {

        List(self.plateData.plates.sorted { $0.state < $1.state } ) { plate in
                NavigationLink(destination: PlateViewContentView (plate: plate)) {
  
//                   Text("Plate_Count \( self.plateData.plates.count)")
                    
                if plate.state == self.usstate.state {
                    
                // display state plate image
                Image(plate.imageLink)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 75.0, height: 50.0)
                    .clipShape(Rectangle())
                    .overlay(Rectangle()
                    .stroke(Color.red, lineWidth: 3))
                                        
                    
 //               Text(plate.state)
//                Text("\(plate.id)")
                Text(plate.name)
 //               Text(plate.imageLink)
                }
              //  else {
              //      Text("Not Available Yet")
              //      }
              }
 //               .padding()
                
            }
            .navigationBarTitle(Text(verbatim: "Plates"), displayMode: .inline)
        }
}

class PlateDownloader: ObservableObject {
    @Published var plates: Plates = [Plate]()

    init() {
        guard let url = URL(string: platesEndpoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let plates = try JSONDecoder().decode(Plates.self, from: data)
                DispatchQueue.main.async {
                    self.plates = plates
                }
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
}
