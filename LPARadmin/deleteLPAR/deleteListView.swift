//
//  deleteContentView.swift
//  LPARadmin
//
//  Created by Allan Hull on 10/25/20.
//  Copyright © 2020 Allan Hull. All rights reserved.
//

import SwiftUI

let modStatesEndpoint = "https://allanhull.net/downloads/states_lpar_ui.json"

struct modState: Codable, Identifiable {
    public var id: Int
    public var state: String
    public var image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case state = "state"
        case image = "image"
    }
}

typealias modStates = [modState]

class modStateDownloader: ObservableObject {
    @Published var modstates: modStates = [modState]()

    init() {
        guard let url = URL(string: modStatesEndpoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let modstates = try JSONDecoder().decode(      modStates.self, from: data)
                DispatchQueue.main.async {
                    self.modstates = modstates
                    print(self.modstates)
                }
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
}




struct deleteListView: View {
        
        @ObservedObject var modstateData: modStateDownloader = modStateDownloader()
        
        var body: some View {
            NavigationView {
                List(self.modstateData.modstates) { modstate in
                    NavigationLink(destination: deleteContentView(modstate: modstate)) {
    //                    deleteContentView(modstate: modstate)) {

                        Image(modstate.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75.0, height: 50.0)
                            .clipShape(Rectangle())
                            .overlay(Rectangle()
                            .stroke(Color.red, lineWidth: 3))
      
                        Text(modstate.state)
                            .font(.system(size: 22))
                            
                    }
               }
            .navigationBarTitle(Text("States"))
            }
        }
      
}

// struct deleteContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        deleteContentView()
//    }
// }
