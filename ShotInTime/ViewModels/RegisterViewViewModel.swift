//
//  RegisterViewViewModel.swift
//  ShotInTime
//
//  Created by Александр Полочанин on 4.09.23.
//

import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    
    func register() {
        guard validate() else {
            return
        }
       
    }
    
    private func insertUserRecord(id: String ) {
       
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            return false
        }

        guard password.count > 7 else {
            return false
        }
        return true
    }
}
