//
//  ViewController.swift
//  animationHW
//
//  Created by Светлана Сенаторова on 06.08.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    @IBOutlet var mainView: SpringView!
    @IBOutlet weak var viewLabel: SpringLabel!
    @IBOutlet weak var button: SpringButton!
    
    private var counter = 0
    private var currentAnimations = Animation.getAnimations()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLabel.text = setLabelText(currentAnimations[counter])
    }

    @IBAction func buttonPressed(_ sender: SpringButton) {
        
        if counter < currentAnimations.count - 1 {
            setCurrentAnimation()
            counter += 1
            mainView.reloadInputViews()
            sender.setTitle("Show \(currentAnimations[counter].name.uppercased())", for: .normal)
        } else {
            counter = 0
            setCurrentAnimation()
            counter += 1
            mainView.reloadInputViews()
            sender.setTitle("Show \(currentAnimations[counter].name.uppercased())", for: .normal)
        }
    }
}

extension ViewController {
    
    private func setCurrentAnimation() {
        let animation = currentAnimations[counter]
        button.setTitle("\(animation.name.uppercased())", for: .normal)
        viewLabel.text = setLabelText(animation)
        mainView.animation = animation.name
        mainView.curve = animation.curve
        mainView.force = CGFloat(animation.force)
        mainView.duration = CGFloat(animation.duration)
        mainView.delay = CGFloat(animation.delay)
        mainView.animate()
    }
    
    private func getFormatedValue(_ value: Float) -> String {
        String(format: "%.2f", value)
    }
    
    private func setLabelText(_ animation: Animation) -> String {
        "preset: \(animation.name.uppercased()) \ncurve: \(animation.curve) \nforse: \(getFormatedValue(animation.force)) \nduration: \(getFormatedValue(animation.duration)) \ndelay: \(getFormatedValue(animation.delay))"
    }
}

