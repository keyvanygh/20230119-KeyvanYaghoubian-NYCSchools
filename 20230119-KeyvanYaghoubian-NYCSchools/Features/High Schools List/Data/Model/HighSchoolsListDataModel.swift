//
//  File.swift
//  Coconut Remake
//
//  Created by Keyvan  on 1/17/23.
//

import Foundation

struct HighSchoolsListDataModel  {
    let highSchools : [HighSchoolDataModel]

    init(
        highSchools : [HighSchoolDataModel]){
            self.highSchools = highSchools
        }
    
    func toEntity() -> HighSchoolsListEntity{
        
         let schoolsListEntity = highSchools.map { highSchoolDataModel in
            highSchoolDataModel.toEntity()
        }
        return HighSchoolsListEntity(highSchools: schoolsListEntity)
    }
    
}

struct HighSchoolDataModel: Codable , Identifiable , IHighSchoolEntity {
    let id: UUID = UUID()
    let name : String
    let dbn : String
    
    enum CodingKeys : String, CodingKey {
        case name = "school_name"
        case dbn
    }
    func toEntity() -> HighSchoolEntity{
        return HighSchoolEntity(name:  name,dbn: dbn)
    }
}
//sat_math_avg_score
