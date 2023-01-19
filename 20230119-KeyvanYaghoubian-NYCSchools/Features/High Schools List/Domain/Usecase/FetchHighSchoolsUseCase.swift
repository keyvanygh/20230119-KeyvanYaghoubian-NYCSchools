//
//  SignInWithEmail.swift
//  Coconut Remake
//
//  Created by Keyvan  on 1/17/23.

import Foundation

class FetchHighSchoolsUseCase: AnyUseCase{
    typealias Params = FetchHighSchoolsParams
    typealias Entity = HighSchoolsListEntity
    typealias Repository = IHighSchoolsListRepository
    
    let repository: Repository
    init(repository: Repository) {
        self.repository = repository
    }
    
    func call(params: FetchHighSchoolsParams) async -> Result<HighSchoolsListEntity, Error> {
        return await repository.fetchHighSchoolsList()
    }
}
struct FetchHighSchoolsParams {
}
