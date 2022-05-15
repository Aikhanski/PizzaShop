//
//  ProfileViewModel.swift
//  PizzaShop
//
//  Created by Mac on 15.04.2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: MyUser
    
    init(profile: MyUser){
        self.profile = profile
    }
    
    func setProfile() {
        DataBaseService.shared.setProfile(user: self.profile) {  result in
            switch result {
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Ошибка отправки данных \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        DataBaseService.shared.getProfile { result in
            switch result {
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription )
            }
        }
    }
    
}
