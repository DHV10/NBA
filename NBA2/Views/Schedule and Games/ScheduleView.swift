//
//  ScheduleView.swift
//  NBA2
//
//  Created by DHV on 04/08/2021.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var model: DataModel 
    
    var body: some View {
        
        ZStack {
            
//            Color("backdrop")
//                .ignoresSafeArea()
            
            ScrollView {
                
                LazyVStack(spacing: 20) {
                    
                    HStack {
                        
                        Text("Games")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        Image("nba")
                            .resizable()
                            
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 60, alignment: .center)
                        
                    }
                    
                    Picker(selection: $model.selectedDay, label: Text("")) {
                        
                        Text("Yesterday").tag(DateCategory.yesterday)
                        Text("Today").tag(DateCategory.today)
                        Text("Tomorrow").tag(DateCategory.tommorrow)
                        
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    //Games
                    if let sched = model.scheduleDict[model.selectedDay] {
                        
                        ForEach(sched!.games) { game in
                            
                            if game.Status != "Canceled" {
                                
                                GameView(game: game)
                            }
                            
                        }
                        
                        //show total games
                        let gameCount = sched!.games.count
                        if gameCount == 1 {
                            Text("\(gameCount) Game")
                                .bold()
                                .padding()
                        }else {
                            Text("\(gameCount) Games")
                                .bold()
                                .padding()
                        }
                    
                        
                    }
                    else {
                        Text("Null Schedule Instance")
                            .bold()
                    }
                    
                }
                .padding(.horizontal)
                
            }
            
        }
        
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
