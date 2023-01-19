//
//  SigninEntity.swift
//  Coconut Remake
//
//  Created by Keyvan  on 1/17/23.

import Foundation

struct HighSchoolsListEntity: IHighSchoolsListEntity{
    
    let highSchools : [HighSchoolEntity]

}
struct HighSchoolEntity : IHighSchoolEntity , Identifiable{
    let id = UUID()
    let name: String
    let dbn: String
    var sats : HighSchoolSATsEntity?
}
protocol IHighSchoolsListEntity{
    var highSchools : [HighSchoolEntity] { get  }

}

protocol IHighSchoolEntity{
    var name : String {get}

}



