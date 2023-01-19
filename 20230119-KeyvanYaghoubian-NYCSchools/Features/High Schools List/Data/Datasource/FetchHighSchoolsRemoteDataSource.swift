//
//  SigninWithEmailRemoteDataSource.swift
//  Coconut Remake
//
//  Created by Keyvan on 1/17/23.
//

import Foundation

class FetchHighSchoolsRemoteDataSource: AnyRemoteDataSource {
    let requests : BaseRequests
    init(requests: BaseRequests) {
        self.requests = requests
    }
    typealias ReturnDataModel = HighSchoolsListDataModel
    let endpoint = "/resource/s3k6-pzi2.json"
    
    func fetchHighSchoolsList() async throws -> HighSchoolsListDataModel {
        let data = try await requests.get(endPoint: endpoint)
        return try parse(jsonData: data)
    }
    
    func parse(jsonData: Data) throws -> HighSchoolsListDataModel {
        let decoder = JSONDecoder()
        let schoolsDataModel = try decoder.decode([HighSchoolDataModel].self, from: jsonData)
        let listDataModel = HighSchoolsListDataModel(highSchools: schoolsDataModel)
        return listDataModel
        
    }
}

