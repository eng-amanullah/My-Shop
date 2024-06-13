//
//  AccountView.swift
//  My Shop
//
//  Created by Amanullah Sarker on 10/6/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Enter first name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                        .textInputAutocapitalization(.words)
                    
                    TextField("Enter last name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                        .textInputAutocapitalization(.words)
                    
                    TextField("Enter email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .submitLabel(.done)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    DatePicker("BirthDate", selection: $viewModel.user.birthDate,
                               /*in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,*/ displayedComponents: .date)
                    
                    Button("Save changes") {
                        viewModel.saveChanges()
                    }
                }
                
                Section(header: Text("Feature")) {
                    /*ShopToggle(title: "Dark Mode", isDarkMood: $viewModel.isDarkMood)*/
                    Toggle("Dark Mode", isOn: $viewModel.isDarkMood)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimaryColorV2))
                }
                
                Section(header: Text("Language")) {
                    /*ShopToggle(title: "English", isDarkMood: $viewModel.isEnglish)*/
                    Toggle("English", isOn: $viewModel.isEnglish)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimaryColorV2))
                }
            }
            .onAppear {
                viewModel.getUserData()
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dissmiss") {
                        focusedTextField = nil
                    }
                }
            }
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title, message: alert.message, dismissButton: alert.dissmissButton)
            }
        }
    }
}

#Preview {
    AccountView()
}
