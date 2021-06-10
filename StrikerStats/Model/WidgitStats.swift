//
//  WidgitStats.swift
//  StrikerStats
//
//  Created by Mike Conner on 10/9/20.
//  Copyright © 2020 Rocking Triangle. All rights reserved.
//

import SwiftUI
import WidgetKit

struct WidgitStats {
    @AppStorage(Constants.ProjectReferences.key, store: UserDefaults(suiteName: Constants.ProjectReferences.appGroup)) var widgitStatData: Data = Data()
    let stats: Stats
    
    
    func storeItem() {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(stats) else { return }
        widgitStatData = data
        WidgetCenter.shared.reloadAllTimelines()
    }
    
}
