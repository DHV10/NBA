//
//  InforColumnView.swift
//  NBA2
//
//  Created by DHV on 04/08/2021.
//

import SwiftUI

struct InforColumnView: View {
    var team: String
    var score: Int?
    var body: some View {
        VStack(alignment: .center) {
            
            //Logo
            Image(team)
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75, alignment: .center)
            
            //Team Label
            Text(team)
            //Score
            if let score = score {
                
                Text(String(score))
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                
            }else {
                Text("-")
            }
            
        }
        .padding()
    }
}

