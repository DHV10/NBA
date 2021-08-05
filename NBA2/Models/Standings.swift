//
//  Standings.swift
//  NBA2
//
//  Created by DHV on 04/08/2021.
//

import Foundation

struct Team: Decodable, Identifiable {
    var id: UUID?
    var Key: String
    var City: String
    var Name: String
    var Conference: String
    var TeamID: Int
    var Wins: Int
    var Losses: Int
    var Percentage: Double
    var ConferenceRank:Int
}

struct Standings: Decodable {
    
    var teams:[Team]
    var west: [Team]
    var east: [Team]
    
    init() {
        self.teams = [Team]()
        self.west = [Team]()
        self.east = [Team]()
    }
    
    mutating func sortConferences() {
        //west team and east team
        for t in teams {
            
            if t.Conference == "Eastern" {
                self.east.append(t)
                
            }else {
                self.west.append(t)
            }
            
            //sort east array
            self.east.sort { t1 , t2  in
                return t1.Percentage > t2.Percentage
            }
            
            //sort west array
            self.west.sort { t1 , t2  in
                return t1.Percentage > t2.Percentage
            }
            
        }
        
        
    }
    
}
