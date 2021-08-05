//
//  DataModel.swift
//  NBA2
//
//  Created by DHV on 04/08/2021.
//

import Foundation
import FirebaseAuth


class DataModel: ObservableObject {
    //Dictionary of schedule instances
    @Published var scheduleDict: [DateCategory:Schedule?] = [:]
    
    //current date , emum for date in date helper
    @Published var selectedDay: DateCategory
    
    @Published var standings:Standings?
    
    //Authentication
    @Published var loggedIn = false
    
    init() {
        //default day is today
        self.selectedDay = DateCategory.today
        
        //load data from API
        //load schedule and games data
        loadSched(day: DateCategory.yesterday)
        loadSched(day: DateCategory.today)
        loadSched(day: DateCategory.tommorrow)
        
        //load standings data
        loadStandings()
        
    }
    
    
    func checkLogin() {
        loggedIn = Auth.auth().currentUser != nil ? true : false
        
    }
    
    
    func loadSched(day: DateCategory) {
        
        //get string date in right format
        //let formattedDate = DateHelper.getDateString(day: day)
        
        //create URL
        guard let url = URL(string: "https://fly.sportsdata.io/v3/nba/scores/json/GamesByDate/2020-DEC-11?key=\(Constants.apiKey)") else {
            fatalError("Wrong URL for Schedule")
        }
        
        //data task  for API Call
        URLSession.shared.dataTask(with: url) { data , response , error in
            
            do {
                
                if error == nil && data != nil {
                    
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([Game].self, from: data!)
                    
                    //assign each game an id
                    for game in result {
                        game.id = UUID()
                    }
                    
                    //assign result to dictionary
                    let newSched = Schedule()
                    DispatchQueue.main.async {
                        newSched.games = result
                        self.scheduleDict[day] = newSched
                        
                        //self.scheduleDict[day] = result
                    }
                    
                }
                
            }catch {
                fatalError("Fail to parse JSON into Schedule! \(error)")
            }
            
        }.resume()
        
        
    }
    
    
    func loadStandings() {
        
        guard let url = URL(string: "https://fly.sportsdata.io/v3/nba/scores/json/Standings/2021?key=\(Constants.apiKey)") else {
            fatalError("BAD URL FOR STANDINGS")
        }
        
        // Data task for API call
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if error == nil && data != nil {
                    
                    // Parse incoming JSON; will be parsed as an array of teams
                    let decoder = JSONDecoder()
                    var incomingData = try decoder.decode([Team].self, from: data!)
                    
                    // Assign each team an id
                    for t in (0..<incomingData.count) {
                        incomingData[t].id = UUID()
                    }
                    
                    // Create a new team object, give it the array of teams, sort it, assign it to model's standings property
                    // See Standings.swift
                    var newStandings = Standings()
                    DispatchQueue.main.async {
                        newStandings.teams = incomingData
                        newStandings.sortConferences()
                        self.standings = newStandings
                    }
                }
            } catch {
                fatalError("Failed to parse JSON into Standings! \n\(error)")
            }
        }.resume()
        
    }
    
}
