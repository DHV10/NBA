//
//  LoginView.swift
//  NBA2
//
//  Created by DHV on 05/08/2021.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @EnvironmentObject var model: DataModel
    @State var loginMode = Constants.LoginMode.login
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var errorMessage: String?
    
    var buttonText: String {
        if loginMode == Constants.LoginMode.login {
            return "Login"
            
        }else {
            return "Sign Up"
        }
        
    }
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            //logo
            Image("nba")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 150)
            
            //title
            Text("NBA APP")
                .font(.title)
                .bold()
            Spacer()
            //picker to seclect login mode
            Picker(selection: $loginMode, label: Text("Picker"), content: {
                Text("Login")
                    .tag(Constants.LoginMode.login)
                Text("Sign Up")
                    .tag(Constants.LoginMode.createAccount)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            //Form
            Group {
                TextField("Email", text: $email)
                
                if loginMode == Constants.LoginMode.createAccount {
                    TextField("Name", text: $name)
                }
                    
                SecureField("Password", text: $password)
                
                if errorMessage != nil {
                    Text(errorMessage!)
                }
                
            }
            //Button
            Button(action: {
                
                
                if loginMode == Constants.LoginMode.login {
                    Auth.auth().signIn(withEmail: email, password: password) { result , error  in
                        
                        
                        guard error == nil else {
                            self.errorMessage = error!.localizedDescription
                            return
                        }
                        
                        self.errorMessage = nil
                        
                        self.model.checkLogin()
                    }
                    
                }else {
                    Auth.auth().createUser(withEmail: email, password: password) { result , error  in
                        
                        guard error == nil else {
                            self.errorMessage = error! .localizedDescription
                            return
                        }
                        
                        self.errorMessage = nil
                        
                        self.model.checkLogin()
                        
                    }
                }
            }, label: {
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(height: 40)
                        .cornerRadius(10)
                    
                    Text(buttonText)
                        .foregroundColor(.white)
                    
                }
                
            })
            Spacer()
        }
        .padding(.horizontal, 40)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
