//
//  SigninRepository.swift
//  Coconut Remake
//
//  Created by Keyvan  on 1/17/23.
//

import Foundation

class HighSchoolsListRepository: IHighSchoolsListRepository{
    
    let remoteDataSource : FetchHighSchoolsRemoteDataSource
    init(remoteDataSource: FetchHighSchoolsRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchHighSchoolsList() async -> Result<HighSchoolsListEntity, Error> {
        do{
            let highSchoolsDataModel = try await remoteDataSource.fetchHighSchoolsList()
            return .success(highSchoolsDataModel.toEntity())
            
        }catch{
            return .failure(error)
        }
    }
    

}
