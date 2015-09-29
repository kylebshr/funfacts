//
//  Fact.swift
//  Fun Facts
//
//  Created by Kyle Bashour on 9/26/15.
//  Copyright © 2015 Kyle Bashour. All rights reserved.
//

import Foundation
import UIKit

// A simple struct to contain all the info about a Fact
struct Fact {

    let text: String
    let color: UIColor
    let textColor: TextColor
}

// An enum specifying whether the text should be white or black
enum TextColor {
    case white
    case black
}
