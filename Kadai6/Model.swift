//
//  Model.swift
//  Kadai6
//
//  Created by mana on 2021/12/16.
//

import Foundation

class Judgement: ObservableObject {
    @Published var targetValue = Int.random(in: 1...100)
    @Published var isCorrectAnswer = false

    func result(inputValue: Float) {
        if Int(inputValue) == targetValue {
            isCorrectAnswer = true
        }
    }

    func retry() {
        targetValue = Int.random(in: 1...100)
        isCorrectAnswer = false
    }
}
