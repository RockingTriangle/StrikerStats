//
//  StrikerStatsHomeVC.swift
//  StrikerStats
//
//  Created by Mike Conner on 10/1/20.
//

import UIKit

class StrikerStatsHomeVC: UIViewController {
    
    // MARK: - Variables
    var stats = Stats(goals: 0, assists: 0)
    let defaults = UserDefaults.standard
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var goalsView:           UIView!
    @IBOutlet weak var assistsView:         UIView!
    @IBOutlet weak var goalsValueLabel:     UILabel!
    @IBOutlet weak var assistsValueLabel:   UILabel!
    @IBOutlet weak var goalsStepper:        SS_Stepper!
    @IBOutlet weak var assistsStepper:      SS_Stepper!
    

    // MARK: - Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadStats()
        configureLabelsWithData()
        addDropShadows()
    }
        
    
    // MARK: - IBActions
    @IBAction func goalsStepperWasTapped(_ sender: UIStepper) {
        goalsValueLabel.text = sender.value.asString()
        stats.goals = sender.value.asInt()
        saveStats()
    }
    
    
    @IBAction func assistsStepperWasTapped(_ sender: UIStepper) {
        assistsValueLabel.text = sender.value.asString()
        stats.assists = sender.value.asInt()
        saveStats()
    }
    
    
    // MARK: - Functions
    func loadStats() {
        if let savedStatsData = defaults.object(forKey: Constants.ProjectReferences.key) as? Data {
            let decoder = JSONDecoder()
            if let savedStats = try? decoder.decode(Stats.self, from: savedStatsData) {
                self.stats.goals = savedStats.goals
                self.stats.assists = savedStats.assists
            }
        } 
    }
    
    
    func saveStats() {
        let encoder = JSONEncoder()
        if let encodedStats = try? encoder.encode(stats) {
            defaults.setValue(encodedStats, forKey: Constants.ProjectReferences.key)
            let widgetStats = WidgitStats(stats: stats)
            widgetStats.storeItem()
        }
    }
    
    
    func addDropShadows() {
        goalsView.dropShadow()
        assistsView.dropShadow()
    }
    

    func configureLabelsWithData() {
        goalsValueLabel.text = stats.goals.description
        goalsStepper.value = stats.goals.asDouble()
        assistsValueLabel.text = stats.assists.description
        assistsStepper.value = stats.assists.asDouble()
    }
}

