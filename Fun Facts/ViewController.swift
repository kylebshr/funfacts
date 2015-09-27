//
//  ViewController.swift
//  Fun Facts
//
//  Created by Kyle Bashour on 9/26/15.
//  Copyright © 2015 Kyle Bashour. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var newFactButton: UIButton!

    let factGenerator = FactGenerator()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateFact(factGenerator.currentFact(), animated: false)
    }

    @IBAction func factButtonPressed(sender: UIButton) {
        updateFact(factGenerator.nextFact(), animated: true)
    }

    func updateFact(fact: Fact, animated: Bool) {

        let duration = animated ? 0.3 : 0.0

        UIView.animateWithDuration(duration) { _ in

            self.view.backgroundColor = fact.color
            self.setNeedsStatusBarAppearanceUpdate()

            if fact.textColor == .white {
                self.newFactButton.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.3)
            }
            else {
                self.newFactButton.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
            }
        }

        UIView.transitionWithView(factLabel, duration: duration, options: .TransitionCrossDissolve, animations: { _ in
            self.factLabel.text = fact.text
            self.factLabel.textColor = fact.textColor == .white ? UIColor.whiteColor() : UIColor.blackColor()
        }, completion: nil)
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return factGenerator.currentFact().textColor == .white ? .LightContent : .Default
    }
}
