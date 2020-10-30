//
//  PlateViewContentView.swift
//  LPAR
//
//  Created by Allan Hull on 3/9/20.
//  Copyright © 2020 Allan Hull. All rights reserved.
//

import SwiftUI

struct PlateViewContentView: View {
    var plate: Plate
    
    // @State display variables
    @State private var text: String = "Enter some text: "
    @State private var textIdentifier: String = "Identifier"
    @State private var textState: String = "State"
    @State private var textName: String = "Name"
    @State private var textDescription: String = "Description"
    @State private var textYear: String = "Year"
    @State private var textCost: String = "Cost"
    @State private var textCategory: String = "Category"
    @State private var textImagelink: String = "ImageLink"
    @State private var textInfolink: String = "Infolink"
    @State private var textLatitude: String = "Latitude"
    @State private var textLongitude: String = "Longitude"
    @State private var textCreatedat: String = "Created At"
    @State private var textUpdatedat: String = "Updated At"
    
    @State var username: String = ""

    // State used to toggle showing our sheet containing AR QL preview
    @State var showingPreview = false
      
    // Turns off & on the ability to change the preview size within ARKit.
    @State var allowsScaling = false
    
    var imageType: String = "MyScene"
    
      
    var body: some View {
        VStack (alignment: .leading) {

                TextField("Enter State...", text: $textState)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
            

                TextField("Enter Description...", text: $textDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            

                TextField("Enter Year...", text: $textYear)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            

                TextField("Enter Cost...", text: $textCost)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            

                TextField("Enter Category...", text: $textCategory)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            

                TextField("Enter Imagelink...", text: $textImagelink)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            

               TextField("Enter Infolink...", text: $textInfolink)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
 
            TextField("Enter Latitude...", text: $textLatitude)
                 .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Enter Longitude...", text: $textLongitude)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            VStack (alignment: .leading) {
                
          
            
 //           HStack{
                // Button: Add
                Button(action: {
                    print("Add")
                    print($username)
                    self.addRecord()
                }) {
                    Text("Add Record")
                        .font(.system(size:12))
                        .foregroundColor(.gray)
                        .font(.title)
                        .padding()
                        .border(Color.red, width: 5)
                }

//            HStack{
                // Button: Modify
                Button(action: {
                    print("Modify")
                    self.modifyRecord()
                }) {
                    Text("Modify Record")
                        .font(.system(size:12))
                        .foregroundColor(.gray)
                        .font(.title)
                        .padding()
                        .border(Color.red, width: 5)
                }

 //           HStack{
                // Button: Delete
                Button(action: {
                    print("Delete")
                    self.deleteRecord()
                }) {
                    Text("Delete Record")
                        .font(.system(size:12))
                        .foregroundColor(.gray)
                        .font(.title)
                        .padding()
                        .border(Color.red, width: 5)
                }
                                
 //           } // end VStack
            } // end Vstack/
        
    }
        
    }
    
    // Function: addRecord()
    func addRecord() {
        print("Function: addRecord")
    }
    
    // Function: modifyRecord()
    func modifyRecord() {
        print("Function: modifyRecord")
    }
    
    // Function: deleteRecord()
    func deleteRecord() {
        print("Function: deleteRecord")
    }
    
    
}  // END: PlateViewContentView

// struct PlateViewContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlateViewContentView()
//    }
// }
