//
//  ConferenceStandingsView.swift
//  NBA2
//
//  Created by DHV on 05/08/2021.
//

import SwiftUI

struct ConferenceStandingsView: View {
    
    var teams: [Team]
    var body: some View {
        LazyVStack {
            
                ForEach(Array(teams.enumerated()), id: \.offset) { offset , team in
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .shadow(radius: 5)
                    
                    HStack {
                        
                        Text(String(offset + 1))
                            .bold()
                            .frame(width: 30, height: 20, alignment: .center)
                        
                        Image(team.Key)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30, alignment: .center)
                            .padding(.vertical)
                        
                        Text("\(team.City) \(team.Name)")
                            .bold()
                        
                        Spacer()
                        
                        Text("\(team.Wins) - \(team.Losses)")
                            .frame(width: 60, height: 20, alignment: .center)
                            .padding(.trailing)
                       
                    }
                    
                }
                
            }
            
        }
        .padding(.horizontal)
    }
}


