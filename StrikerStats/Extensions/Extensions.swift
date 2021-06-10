//
//  Extensions.swift
//  StrikerStats
//
//  Created by Mike Conner on 9/19/20.
//

import UIKit


public extension UIView {
    func dropShadow(opacity: Float = 1, width: Int = 2, height: Int = 2, radius: CGFloat = 4) {
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowRadius = radius
    }
}


public extension Double {
    func asInt() -> Int {
        return Int(self)
    }
    
    
    func asString() -> String {
        return String(Int(self))
    }
}


public extension Int {
    func asDouble() -> Double {
        return Double(self)
    }
}


public extension FileManager {
    static var documentsDirectoryURL: URL {
        return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
