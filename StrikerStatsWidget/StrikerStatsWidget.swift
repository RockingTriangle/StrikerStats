//
//  StrikerStatsWidget.swift
//  StrikerStatsWidget
//
//  Created by Mike Conner on 10/9/20.
//  Copyright © 2020 Rocking Triangle. All rights reserved.
//

import WidgetKit
import SwiftUI

struct StatsDataEntry: TimelineEntry {
    let date: Date = Date() // All TimelineEntry
    let stats: Stats 
}


struct Provider: TimelineProvider {
    @AppStorage(Constants.ProjectReferences.key, store: UserDefaults(suiteName: Constants.ProjectReferences.appGroup)) var widgitStatData: Data = Data()
    
    func placeholder(in context: Context) -> StatsDataEntry {
        let stats = Stats(goals: 0, assists: 0)
        return StatsDataEntry(stats: stats)
    }

    
    func getSnapshot(in context: Context, completion: @escaping (StatsDataEntry) -> ()) {
        let stats = try? JSONDecoder().decode(Stats.self, from: widgitStatData)
        let entry: StatsDataEntry
        
        if context.isPreview && stats != nil {
            entry = StatsDataEntry(stats: stats!)
        } else {
            entry = StatsDataEntry(stats: Stats(goals: 0, assists: 0))
        }
        
        completion(entry)
    }

    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        guard let stats = try? JSONDecoder().decode(Stats.self, from: widgitStatData) else { return }
        
        let entry = StatsDataEntry(stats: stats)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}


struct StrikerStatsWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        SmallWidget(entry: entry)
    }
}


struct SmallWidget: View {
    var entry: Provider.Entry

    var body: some View {
        ZStack{
            Image(Constants.Images.widgetBG)
                .resizable()
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(Constants.Colors.green))
                        .shadow(color: .white, radius: 4, x: 2, y: 2)
                    VStack {
                        Text("GOALS")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                        Text(entry.stats.goals.description)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                            .padding(.top, -15)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(Constants.Colors.green))
                        .shadow(color: .white, radius: 4, x: 2, y: 2)
                    VStack {
                        Text("ASSISTS")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                        Text(entry.stats.assists.description)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                            .padding(.top, -15)
                    }
                }
                Spacer()
            }.padding(.horizontal, 8.0)
        }
    }
}


@main
struct StrikerStatsWidget: Widget {
    let kind: String = Constants.ProjectReferences.appName

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            StrikerStatsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName(Constants.ProjectReferences.appName)
        .description(Constants.ProjectReferences.widgitDescription)
        .supportedFamilies([.systemSmall])
    }
}


struct StrikerStatsWidget_Previews: PreviewProvider {
    static let stats = Stats(goals: 34, assists: 22)
    static var previews: some View {
        StrikerStatsWidgetEntryView(entry: StatsDataEntry(stats: stats))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
