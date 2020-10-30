//
//  ContentViewTemp.swift
//  LPARadmin
//
//  Created by Allan Hull on 10/25/20.
//  Copyright © 2020 Allan Hull. All rights reserved.
//

import SwiftUI

let usStatesEndpoint = "https://allanhull.net/downloads/states_lpar_ui.json"

struct usState: Codable, Identifiable {
    public var id: Int
    public var state: String
    public var image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case state = "state"
        case image = "image"
    }
}

typealias usStates = [usState]

class usStateDownloader: ObservableObject {
    @Published var usstates: usStates = [usState]()

    init() {
        guard let url = URL(string: usStatesEndpoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let usstates = try JSONDecoder().decode(      usStates.self, from: data)
                DispatchQueue.main.async {
                    self.usstates = usstates
                    print(self.usstates)
                }
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
}




struct ContentViewTemp: View {
//    var body: some View {
//        Text("Hello, World!")
//    }
    
      @ObservedObject var usstateData: usStateDownloader = usStateDownloader()
      
      var body: some View {
          NavigationView {
              List(self.usstateData.usstates) { usstate in
                  NavigationLink(destination:     //FlagContentView(usstate: usstate)) {
                      PlateContentView(usstate: usstate)) {

                      Image(usstate.image)
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: 75.0, height: 50.0)
                          .clipShape(Rectangle())
                          .overlay(Rectangle()
                          .stroke(Color.red, lineWidth: 3))
    
                      Text(usstate.state)
                          .font(.system(size: 22))
                          
                  }
             }
          .navigationBarTitle(Text("States"))
          }
      }
    
    
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
// }

