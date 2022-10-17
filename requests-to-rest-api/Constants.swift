//
//  Constants.swift
//  requests-to-rest-api
//
//  Created by Nikolay Kiyko on 16.10.2022.
//  Copyright ⓒ Nikolay Kiyko 2022. All rights reserved.
//

import UIKit

enum Constants {
    enum Colours {
        static var textColour: UIColor {
            UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
    }
    
    enum Fonts {
        static var ui14InterRegular: UIFont? {
            UIFont(name: "Helvetica", size: 14)
        }
        
        static var ui16InterSemi: UIFont? {
            UIFont(name: "Helvetica-Bold", size: 16)
        }
        
        static var ui30InterSemi: UIFont? {
            UIFont(name: "Helvetica-Bold", size: 30)
        }
    }
}
