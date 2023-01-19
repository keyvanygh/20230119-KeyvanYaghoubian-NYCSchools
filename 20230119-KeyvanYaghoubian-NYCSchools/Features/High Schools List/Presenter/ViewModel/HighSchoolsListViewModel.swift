//
//  SigninViewModel.swift
//  Coconut Remake
//
//  Created by Keyvan  on 1/17/23.
//

import Foundation
import Factory

class HighSchoolsListViewModel: ObservableObject {
    
    @Injected(Container.fetchHighSchoolsUseCase) private var fetchHighSchoolsUseCase : FetchHighSchoolsUseCase
    
    @Published var showAlertState : Bool
    @Published private(set) var fetchSchoolsListState : FetchSchoolsListState {
        didSet{
            if(fetchSchoolsListState == .Failed){
                showAlertState = true
            }
        }
    }
    @Published private(set) var fetchSATState : FetchSchoolsListState {
        didSet{
            if(fetchSchoolsListState == .Failed){
                showAlertState = true
            }
        }
    }
    
    init() {
        self.fetchSchoolsListState = .Init
        self.fetchSATState = .Init
        self.showAlertState = false
    }

    func addEvent(event : SchoolsListViewEvent)  {
        switch event {
        case .Init:
            break
        case .FetchSchoolsList:
            Task {
                await fetchSchoolsList()
            }
        }
    }
    private func setFetchSchoolsListState(state : FetchSchoolsListState){
        DispatchQueue.main.async { [weak self] in
            self?.fetchSchoolsListState = state
        }
    }
    
    private func fetchSchoolsList() async {
        setFetchSchoolsListState(state: .Loading)
        let result = await fetchHighSchoolsUseCase.call(params:  FetchHighSchoolsParams())
        switch(result){
        case .success(let highSchoolsListEntity):
            setFetchSchoolsListState(state: .Loaded(highSchoolsListEntity))
            break
        case .failure(_):
            setFetchSchoolsListState(state: .Failed)
        }
    }
}

enum SchoolsListViewEvent{
    case Init,
         FetchSchoolsList
}

enum FetchSchoolsListState : Equatable {
    
    case Init ,Loading ,
         Loaded(HighSchoolsListEntity),
         Failed
    
    static func == (lhs: FetchSchoolsListState, rhs: FetchSchoolsListState) -> Bool {
        return lhs.toRawValue() == rhs.toRawValue()
    }
    func toRawValue() -> Int {
        switch(self){
            
        case .Init:
            return 0
        case .Loading:
            return 1
        case .Loaded:
            return 2
        case .Failed:
            return 3
        }
    }
    func `is`(state: FetchSchoolsListState) -> Bool{
        return self.toRawValue() == state.toRawValue()
    }
}

