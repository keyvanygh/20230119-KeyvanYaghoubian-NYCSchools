//
//  AnyRemoteDataSource.swift
//  NYC HighSchools
//
//  Created by sh on 1/18/23.
//

import Foundation

protocol AnyRemoteDataSource {
    associatedtype ReturnDataModel
    
    func parse(jsonData : Data) throws -> ReturnDataModel
}
