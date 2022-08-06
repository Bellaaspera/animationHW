//
//  Animation.swift
//  animationHW
//
//  Created by Светлана Сенаторова on 06.08.2022.
//

import Foundation

struct Animation {
    let name: String
    let curve: String
    let force: Float
    let duration: Float
    let delay: Float
    
    static func getAnimations() -> [Animation] {
        var animations: [Animation] = []
        let animationType = AnimationType()
        let index = min(animationType.name.count, animationType.curve.count)
        for _ in 0...index {
            animations.append(
                Animation(
                name: animationType.name.shuffled()[Int.random(in: 0..<animationType.name.count)],
                curve: animationType.curve.shuffled()[Int.random(in: 0..<animationType.name.count)],
                force: Float.random(in: 0.2...1.0),
                duration: Float.random(in: 0.2...2.0),
                delay: Float.random(in: 0.2...1.0)
            )
            )
        }
        return animations
    }
}
