//
//  ViewController.swift
//  Fun Facts
//
//  Created by Kyle Bashour on 9/26/15.
//  Copyright © 2015 Kyle Bashour. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlets to our label and button in the storyboard
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var newFactButton: UIButton!

    // A fact generator instance
    let generator = FactGenerator()

    // When our view is loaded, we want to upate to the current fact
    override func viewDidLoad() {
        super.viewDidLoad()

        updateFact(generator.currentFact(), animated: false)
    }

    // When the button is tapped, we update with the next fact
    @IBAction func factButtonPressed(sender: UIButton) {
        updateFact(generator.nextFact(), animated: true)
    }

    // This is a bit different than the one we did in the tutorial — I'll explain as we go
    func updateFact(fact: Fact, animated: Bool) {

        // Sometimes, we may not want to animate the change, so now we take a bool, animated
        // If animated is true, our animation duration will be 0.3; else, it'll be 0.0 (no animation)
        let duration = animated ? 0.3 : 0.0

        // This is just like the function we used, but set up as a "trailing closure" — google that for more info
        UIView.animateWithDuration(duration) { _ in

            // Update the background and status bar
            self.view.backgroundColor = fact.color
            self.setNeedsStatusBarAppearanceUpdate()

            // Check the text color
            if fact.textColor == .white {
                self.newFactButton.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.3)
            }
            else {
                self.newFactButton.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
            }
        }

        // Remember, text and textColor aren't normal UIView properties, so we can't use animateWithDuration
        UIView.transitionWithView(factLabel, duration: duration, options: .TransitionCrossDissolve,
            animations: { _ in

                // Update the text and the textColor
                self.factLabel.text = fact.text
                self.factLabel.textColor = fact.textColor == .white ? UIColor.whiteColor() : UIColor.blackColor()

            },
            completion: nil
        )
    }

    // Simply tell the system which color the status bar should be based on the current fact
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return generator.currentFact().textColor == .white ? .LightContent : .Default
    }
}
