//
//  ContentView.swift
//  Coconut Remake
//
//  Created by Keyvan  on 1/17/23.
//

import SwiftUI

struct HighSchoolsListView: View {
    @StateObject var viewModel = HighSchoolsListViewModel()
    
    @State var enteredEmail : String
    @State var enteredPassword : String
    //    @State var showAditionalInfo : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                switch(viewModel.fetchSchoolsListState){
                case .Loaded(let highSchoolsListEntity):
                    SchoolsList(
                        highSchoolsListEntity: highSchoolsListEntity,
                        viewModel: viewModel)
                case .Loading :
                    ProgressView()
                        .tint(.green)
                default:
                    EmptyView()
                }
            }
            .frame(
                maxWidth : .infinity,
                maxHeight : .infinity,
                alignment : .center
            )
            .alert(isPresented: $viewModel.showAlertState) {
                Alert(
                    title:
                        Text("Error Titile"),
                    message:
                        Text( "Error Descriptiom")
                        .foregroundColor(.red),
                    dismissButton:
                            .default((Text("Dismiss")))
                    
                )
            }
            .onAppear(){
                viewModel.addEvent(event: .FetchSchoolsList)
            }
            .background(Color.white)
            .navigationTitle("Schools")
        }
    }
    
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        HighSchoolsListView(enteredEmail: "",enteredPassword: "")
    }
}

//Move To Widget
struct SchoolsList : View {
    let highSchoolsListEntity : HighSchoolsListEntity
    @State var selectedSchool : HighSchoolEntity? = nil
    @ObservedObject var viewModel : HighSchoolsListViewModel
    var body: some View {
        List {
            ForEach(highSchoolsListEntity.highSchools) { school in
                HStack {
                    Text(school.name)
                        .foregroundColor(.white)
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedSchool = school
                }
            }
            .listRowBackground(Color.green)
        }
        .scrollContentBackground(.hidden)
        .sheet(item: $selectedSchool) { selectedSchool in
            SATsView(highSchool: selectedSchool)
                .presentationDetents([.height(300)])
            
        }
    }
}
