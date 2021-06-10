//
//  SS_Stepper.swift
//  StrikerStats
//
//  Created by Mike Conner on 10/3/20.
//

import UIKit


/// This class is a custom UIStepper subclass.
///
/// This class uses custom SF Symbols for the Increment and Decrement images,
/// a specified background color and tint color, and adds a dropshadow to the control.
class SS_Stepper: UIStepper {
    
    let up      = UIImage(systemName: Constants.Images.up)
    let down    = UIImage(systemName: Constants.Images.down)
    let divider = UIImage(named: Constants.Images.divider)
        
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        configure()
    }
    
    
    func configure() {
        backgroundColor     = UIColor(named: Constants.Colors.green)
        layer.cornerRadius  = 8
        tintColor           = .white
        
        setDecrementImage(down, for: .normal)
        setIncrementImage(up, for: .normal)
        setDividerImage(divider, forLeftSegmentState: .normal, rightSegmentState: .normal)
        
        self.dropShadow()
    }
}
