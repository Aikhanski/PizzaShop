//
//  DataBaseService.swift
//  PizzaShop
//
//  Created by Mac on 13.04.2022.
//

import Foundation
import FirebaseFirestore

class DataBaseService {
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private init() { }
    
    func setProfile(user: MyUser, completion: @escaping (Result<MyUser, Error>)-> ()){
        
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
        
    }
    
    func getProfile(completion: @escaping (Result<MyUser, Error>)-> ()) {
        usersRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            guard let userName = data["name"] as? String else { return }
            guard let userId = data["id"] as? String else { return }
            guard let userPhone = data["phone"] as? Int else { return }
            guard let userAddress = data["address"] as? String else { return }

            let user = MyUser(id: userId, name: userName, phone: userPhone, address: userAddress)
            
            completion(.success(user ))
        }
    }
}
