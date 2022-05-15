//
//  ProfileView.swift
//  PizzaShop
//
//  Created by Mac on 08.04.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented: Bool = false
    @State var isQuitAlertPresented: Bool = false
    @State var isAuthViewPresented: Bool = false
   
    @StateObject var viewModel: ProfileViewModel
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 16) {
                Image("user")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(8)
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }.confirmationDialog("откуда взять фотку", isPresented: $isAvaAlertPresented) {
                        Button {
                            print("Library")
                        } label: {
                            Text("Из галереи")
                        }
                        
                        Button {
                            print("Camera")
                        } label: {
                            Text("Сделать фото")
                        }
                        

                    }
                
                
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Имя", text: $viewModel.profile.name)
                        .font(.body.bold())
                    
                    HStack {
                        Text("+7 ")
                        TextField("Телефон", value: $viewModel.profile.phone, format: .number)
                    }
                    
                }
            }
            VStack(alignment: .leading, spacing: 8){
                Text("Адресс доставки: ")
                    .bold()
                TextField("Ваш адрес: ", text: $viewModel.profile.address)
            }.padding(.horizontal)
            
            //Таблица с заказами
            List {
               Text("Ваши заказы")
            }.listStyle(.plain)
            
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Выйти")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(Color.red)
                    .cornerRadius(20)
                    .foregroundColor(Color.white)
            }.padding()
                .confirmationDialog("Действительно хотите выйти? ", isPresented: $isQuitAlertPresented) {
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Да")
                    }

                }.fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                    AuthView()
                }
        }
        .onSubmit {
            viewModel.setProfile() 
        }
        .onAppear {
            self.viewModel.getProfile()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: MyUser(id: "",
                                                                name: "Айхан",
                                                                phone: 7072202175,
                                                                address: "Тастак-1,1 кв 56")))
    }
}
