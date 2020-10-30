//
//  addContentView.swift
//  LPARadmin
//
//  Created by Allan Hull on 10/25/20.
//  Copyright © 2020 Allan Hull. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation

struct addContentView: View {

    // HTTP Methods
    enum HttpMethod : String {
        case GET
        case POST
        case DELETE
        case PUT
    }
    
    // @State display variables
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
            
            // Button: Add
            Button(action: {
                print("Add")
                print($textState)
                self.addRecord()
            }) {
                Text("Add Record")
                    .font(.system(size:12))
                    .foregroundColor(.gray)
                    .font(.title)
                    .padding()
                    .border(Color.red, width: 5)
            }
    
        } // end VStack()
                
    } // end Body()
    
    // Function: addRecord()
    func addRecord() {
        print("Function: addRecord START")
        print("State = ",$textState)
        print("Description = ",$textDescription)
        print("Year = ",$textYear)
        print("Cost = ",$textCost)
        print("Category = ",$textCategory)
        print("ImageLink = ",$textImagelink)
        print("Infolink = ",$textInfolink)
        print("Latitude = ",$textLatitude)
        print("Longitude = ",$textLongitude)
        print("Function: addRecord END")
    }
    
    // Function: HTTP CallPlate
    func CallPlate() {
        
        var paramsDictionary = [String:Any]()
      
            paramsDictionary["identifier"] = "23"
            paramsDictionary["state"] = "Nebraska"
            paramsDictionary["name"] = "Military"
            paramsDictionary["description"] = "Military Retired"
            paramsDictionary["year"] = "2020"
            paramsDictionary["cost"] = "10.00"
            paramsDictionary["category"] = "Military"
            paramsDictionary["imagelink"] = "plate.jpg"
            paramsDictionary["infolink"] = "http://lpar.mobi"
            paramsDictionary["latitude"] = "48.12345"
            paramsDictionary["longitude"] = "-56.333"
        
           HttpClientApi.instance().makeAPICall(url: "https://lpar.mobi/api/v1/plates", params:paramsDictionary, method: .POST, success: { (data, response, error) in

               // API call is Successfull

           }, failure: { (data, response, error) in

               // API call Failure

           })
        
    } // End: CallPlate
    
    // Class: HttpClientAPI
    class HttpClientApi: NSObject {
        
        //TODO: remove app transport security arbitary constant from info.plist file once we get API's
         var request : URLRequest?
         var session : URLSession?

        static func instance() ->  HttpClientApi{

            return HttpClientApi()
        }
        

        func makeAPICall(url: String,params: Dictionary<String, Any>?, method: HttpMethod, success:@escaping ( Data? ,HTTPURLResponse?  , NSError? ) -> Void, failure: @escaping ( Data? ,HTTPURLResponse?  , NSError? )-> Void) {

             request = URLRequest(url: URL(string: url)!)

            print("URL = \(url)")

            if let params = params {


                let  jsonData = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)

                request?.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request?.httpBody = jsonData//?.base64EncodedData()


                //paramString.data(using: String.Encoding.utf8)
            }
            request?.httpMethod = method.rawValue


            let configuration = URLSessionConfiguration.default

            configuration.timeoutIntervalForRequest = 30
            configuration.timeoutIntervalForResource = 30

            session = URLSession(configuration: configuration)
            //session?.configuration.timeoutIntervalForResource = 5
            //session?.configuration.timeoutIntervalForRequest = 5

            session?.dataTask(with: request! as URLRequest) { (data, response, error) -> Void in

                if let data = data {

                    if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                       success(data , response , error as NSError?)
                    } else {
                       failure(data , response as? HTTPURLResponse, error as NSError?)
                    }
                }else {

                   failure(data , response as? HTTPURLResponse, error as NSError?)

                }
                }.resume()

          }
        
        
    } // End: HttpClientAPI
        
}



// struct addContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        addContentView()
//    }
// }
