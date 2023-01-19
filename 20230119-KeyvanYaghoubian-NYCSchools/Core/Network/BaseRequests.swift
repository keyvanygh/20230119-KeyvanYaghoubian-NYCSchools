//
//  BaseRequests.swift
//  NYC HighSchools
//
//  Created by sh on 1/17/23.
//

import Foundation

typealias JsonObject = [String:Any]
typealias JsonArray = [Any]

class BaseRequests {
    
    let session = URLSession.shared
    let baseScheme = "https"
    let api = "data.cityofnewyork.us"
    
    func get(endPoint : String) async throws -> Data {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = baseScheme
        urlComponents.host = api
        urlComponents.path = endPoint

        guard let url = urlComponents.url else{throw(NSError())}
                
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(
            "*/*",
            forHTTPHeaderField: "Accept")
        request.setValue("application/json",
                         forHTTPHeaderField: "Content-Type")
            let (data, _) =  try await URLSession.shared.data(for: request)
            return data
            
        
    }
}
