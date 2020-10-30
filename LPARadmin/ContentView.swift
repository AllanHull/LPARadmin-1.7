//
//  ContentView.swift
//  LPARadmin
//
//  Created by Allan Hull on 8/30/20.
//  Copyright © 2020 Allan Hull. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            addContentView()
                .tag(0)
                .tabItem {
                    VStack {
                        Image("addLPAR")
                        Text("addLPAR")
                    }
                }
            
            deleteListView()
                .tag(1)
                .tabItem {
                    VStack {
                        Image("deleteLPAR")
                        Text("deleteLPAR")
                    }
                }
            
            modifyContentView()
                .tag(2)
                .tabItem {
                    VStack {
                        Image("modifyLPAR")
                        Text("modifyLPAR")
                    }
                }
            
        }
 //       Text("Hello, world!")
 //           .padding()
    }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {

//    }
//}
