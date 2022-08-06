//
//  Animation.swift
//  animationHW
//
//  Created by Светлана Сенаторова on 06.08.2022.
//

import SpringAnimation

struct Animation {
    let name: String
    let curve: String
    let force: Float
    let duration: Float
    let delay: Float
    
    static func getAnimations() -> [Animation] {
        
        var animations: [Animation] = []
        
        let maxIndex = min(AnimationPreset.allCases.count - 1, AnimationCurve.allCases.count - 1)
        
        for index in 0...maxIndex {
            animations.append(
                Animation(
                    name: AnimationPreset.allCases.shuffled()[index].rawValue,
                    curve: AnimationCurve.allCases[Int.random(in: 0..<AnimationCurve.allCases.count)].rawValue,
                    force: Float.random(in: 0.3...2.0),
                    duration: Float.random(in: 0.3...2.0),
                    delay: Float.random(in: 0.2...1.0)
                )
            )
        }
        return animations
    }
}
