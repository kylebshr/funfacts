//
//  FactGenerator.swift
//  Fun Facts
//
//  Created by Kyle Bashour on 9/26/15.
//  Copyright © 2015 Kyle Bashour. All rights reserved.
//

import Foundation
import UIKit

class FactGenerator {

    var facts = [Fact]()
    var currentIndex = 0

    init() {
        facts += [
            Fact(text: "'Facebook Addiction Disorder' is a mental disorder identified by Psychologists.", color: UIColor(red: 217/255.0, green: 56/255.0, blue: 41/255.0, alpha: 1), textColor: .white),
            Fact(text: "Recycling one glass jar saves enough energy to watch TV for 3 hours.", color: UIColor(red: 217/255.0, green: 108/255.0, blue: 0/255.0, alpha: 1), textColor: .white),
            Fact(text: "A duck's quack doesn't echo, and no one knows why.", color: UIColor(red: 251/255.0, green: 199/255.0, blue: 0/255.0, alpha: 1), textColor: .black),
            Fact(text: "It's possible to lead a cow upstairs...but not downstairs.", color: UIColor(red: 59/255.0, green: 198/255.0, blue: 81/255.0, alpha: 1), textColor: .white),
            Fact(text: "Slugs have 4 noses.", color: UIColor(red: 49/255.0, green: 130/255.0, blue: 217/255.0, alpha: 1), textColor: .white),
            Fact(text: "Emus and kangaroos cannot walk backwards, and are on the Australian coat of arms for that reason.", color: UIColor(red: 95/255.0, green: 66/255.0, blue: 192/255.0, alpha: 1), textColor: .white),
            Fact(text: "Intelligent people have more zinc and copper in their hair.", color: UIColor(red: 133/255.0, green: 61/255.0, blue: 174/255.0, alpha: 1), textColor: .white),
            Fact(text: "The first product to have a bar code was Wrigleys gum.", color: UIColor(red: 227/255.0, green: 187/255.0, blue: 210/255.0, alpha: 1), textColor: .black)
        ]
    }

    func nextFact() -> Fact {
        let nextFact = facts[++currentIndex % facts.count]
        return nextFact
    }

    func currentFact() -> Fact {
        return facts[currentIndex % facts.count]
    }
}
