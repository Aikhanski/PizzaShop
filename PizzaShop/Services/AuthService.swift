//
//  AuthService.swift
//  PizzaShop
//
//  Created by Mac on 13.04.2022.
//

import Foundation
import FirebaseAuth
import UIKit

class AuthService {
    
    static let shared = AuthService()
    
    private init() { }
    
    private let auth = Auth.auth()
    
    var currentUser: User? {
        return auth.currentUser
    }
    
    
    // Регистрация в сервисе
    func signUp(email: String, password: String, completion: @escaping(Result<User, Error>) -> ()) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                let myUser = MyUser(id: result.user.uid,
                                    name: "",
                                    phone: 0,
                                    address: "")
                DataBaseService.shared.setProfile(user: myUser) { resultDB in
                    switch resultDB {
                    case .success(_):
                        completion(.success(result.user))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping(Result<User, Error>) -> ()) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
