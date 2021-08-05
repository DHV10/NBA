//
//  SettingsView.swift
//  NBA2
//
//  Created by DHV on 04/08/2021.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    @EnvironmentObject var model: DataModel
    var body: some View {
        Button(action: {
            try! Auth.auth().signOut()
            
            model.checkLogin()
        }, label: {
            Text("Sign Out")
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
