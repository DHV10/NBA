//
//  StandingsView.swift
//  NBA2
//
//  Created by DHV on 04/08/2021.
//

import SwiftUI

struct StandingsView: View {
    @EnvironmentObject var model: DataModel
    
    @State var selectedConf = "east"
    var body: some View {
        
        if let standings = model.standings {
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading) {
                    //header
                    HStack {
                        
                        Text("Standings")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        Image("nba")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 60, alignment: .center)
                        
                    }
                    //picker
                    Picker(selection: $selectedConf, label: Text("")) {
                        
                        Text("East").tag("east")
                        Text("West").tag("west")
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.horizontal)
                
                Divider()
                //standings
                HStack {
                    
                    Text("#")
                        .bold()
                        .frame(width: 25, height: 20, alignment: .center)
                    
                    Text("Team")
                        .bold()
                        .frame(width: 45, height: 20, alignment: .center)
                    
                    Spacer()
                    
                    Text("W - L")
                        .bold()
                        .frame(width: 75, height: 20, alignment: .center)
                }
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                
                Divider()
                
                if selectedConf == "east" {
                    ConferenceStandingsView(teams: standings.east)
                }
                else {
                    ConferenceStandingsView(teams: standings.west)
                    
                }
            }
            
        }
       
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView()
    }
}
