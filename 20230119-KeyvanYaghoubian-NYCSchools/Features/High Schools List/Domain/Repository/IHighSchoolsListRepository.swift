//
//  ISigninRepository.swift
//  Coconut Remake
//
//  Created by Keyvan  on 1/17/23.
//

import Foundation

protocol IHighSchoolsListRepository {
    
    func fetchHighSchoolsList() async -> Result<HighSchoolsListEntity,Error>

}


