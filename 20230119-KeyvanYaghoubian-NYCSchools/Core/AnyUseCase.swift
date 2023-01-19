//
//  AnyUseCase.swift
//  NYC HighSchools
//
//  Created by Keyvan  on 1/17/23.
//

import Foundation


protocol AnyUseCase{
    associatedtype Params
    associatedtype Entity
    associatedtype Repository
    var repository :Repository { get }
    func call(params: Params) async -> Result<Entity, Error>
}

struct NoParams{}
