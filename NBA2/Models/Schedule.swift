//
//  Schedule.swift
//  NBA2
//
//  Created by DHV on 04/08/2021.
//

import Foundation

class Schedule: Decodable, ObservableObject {
    var games: [Game]
    
    init() {
        self.games = [Game]()
    }
}

class Game: Identifiable, Decodable, ObservableObject {
    var id: UUID? = UUID()
    var Status:String
    var DateTime: String
    var AwayTeam: String
    var HomeTeam: String
    var AwayTeamID: Int
    var HomeTeamID: Int
    var AwayTeamScore: Int?
    var HomeTeamScore: Int?
    
    init(status: String, time: String , away: String , home: String , awayID: Int ,
         homeID: Int, awayScore: Int? , homeScore: Int?) {
        self.id = UUID()
        self.Status = status
        self.DateTime = time
        self.AwayTeam = away
        self.HomeTeam = home
        self.AwayTeamID = awayID
        self.HomeTeamID = homeID
        self.AwayTeamScore = awayScore
        self.HomeTeamScore = homeScore
    }
}
