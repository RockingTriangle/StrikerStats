//
//  Constants.swift
//  StrikerStats
//
//  Created by Mike Conner on 10/3/20.
//

import Foundation


/// Struct containing various constants with static values to eliminate using strings from throughout the codebase.
///
/// Goal of these structs are to keep all string constants organized in one place to
/// avoid accidental typos throughout the rest of the project.
struct Constants {
    
    /// This stuct is used to define the Increment and Decrement image names of the SS_Stepper.
    struct Images {
        static let up = "chevron.up"
        static let down = "chevron.down"
        static let widgetBG = "widgitBackgroundImage"
        static let divider = "divider"
    }
    
    
    /// This struct is used to define the color name constants.
    struct Colors {
        static let green = "green"
    }
    
    
    /// This struct is used to define User Default keys and the App Group name.
    struct ProjectReferences {
        static let key = "stats"
        static let appName = "StrikerStats"
        static let appGroup = "group.com.rockingtriangle.MyStrikerStats"
        static let widgitDescription = "See your Striker's Stats on your Home Screen!"
    }
    
}
