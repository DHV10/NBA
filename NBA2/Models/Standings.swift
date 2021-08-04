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
    
    init() {
        self.teams = [Team]()
    }
    
}
