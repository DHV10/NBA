//
//  ContentView.swift
//  NBA2
//
//  Created by DHV on 04/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: DataModel
    
    var body: some View {
        ZStack {
            
            TabView {
            
            ScheduleView()
                .tabItem {
                    VStack {
                        Image(systemName: "sportscourt")
                        Text("Scores")
                    }
                }
            
            StandingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.number")
                        Text("Standings")
                    }
                }
            
            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gearshape")
                        Text("Settings")
                    }
                }
            }
            
        }
    }
}

