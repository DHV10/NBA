//
//  GameView.swift
//  NBA2
//
//  Created by DHV on 04/08/2021.
//

import SwiftUI

struct GameView: View {
    var game: Game
    var body: some View {
        ZStack {
            
            //Card
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5)
            
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Spacer()
                    InforColumnView(team: game.HomeTeam, score: game.HomeTeamScore)
                    
                    Spacer()
                    Text("VS")
                    Spacer()
                    
                    InforColumnView(team: game.AwayTeam, score: game.AwayTeamScore)
                    Spacer()
                    
                }
                
                HStack {
                    Text(game.Status)
                    if game.Status == "Scheduled" {
                        if let dateTime = game.DateTime {
                            Text("@ " + DateHelper.getTimeString(time: dateTime))
                        }else {
                            Text("Canceled")
                        }
                        
                    }
                    
                }
                
            }
            .padding()
            
        }
    }
}

