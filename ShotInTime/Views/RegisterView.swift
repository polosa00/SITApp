//
//  RegisterView.swift
//  ShotInTime
//
//  Created by Александр Полочанин on 4.09.23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    
    var body: some View {
        CustomNavigationView {
            VStack {
                HStack {
                    Text("Привет, представься пожалуйста")
                    Spacer()
                }
                .padding(.top, 50)
                .padding(.horizontal, 16)
                
                VStack {
                    TextField("E-mail", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 18)
                        .background(Color(red: 0.04, green: 0.03, blue: 0.02).opacity(0.04))
                        .cornerRadius(10)
                    TextField("Никнейм", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 18)
                        .background(Color(red: 0.04, green: 0.03, blue: 0.02).opacity(0.04))
                        .cornerRadius(10)
                    
                    SecureField("Пароль", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .padding(.horizontal, 16)
                        .padding(.vertical, 18)
                        .background(Color(red: 0.04, green: 0.03, blue: 0.02).opacity(0.04))
                        .cornerRadius(4)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 50)
            
                
                CustomNavigationLink(
                    destination:
                        ProfileView()
                        .customNavigationTitle("Second Screen")
                        .customNavigationSubtitle("Subtitle should be Showing!!!")
                ) {
                    Text("Подтвердить")
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        .frame(height: 65, alignment: .center)
                        .background(Color(red: 0.04, green: 0.03, blue: 0.02).opacity(0.2))
                        .cornerRadius(16)
                }
                
                
                Spacer()
                
            }
            .background(Color(red: 1, green: 0.97, blue: 0.87))
            .customNavigationTitle("New title")
            .customNavigationBarBackButtonHidden(true)
            .customNavigationSubtitle("new subtitle")
        }
   
    
    }
    

}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
