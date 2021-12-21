//
//  ContentView.swift
//  Kadai6
//
//  Created by mana on 2021/12/16.
//

import SwiftUI

struct ContentView: View {

    @State private var targetValue = Int.random(in: Self.range)
    @State private var inputValue: Float = Float(Self.initialValue)
    @State private var isCorrectAnswer = false
    @State private var isShowAlert = false

    private static let range = 1...100
    private static let initialValue = 50

    var body: some View {
        VStack(spacing: 50.0) {
            Text("\(targetValue)")
                .font(.largeTitle)

            Slider(
                value: $inputValue,
                in: Float(Self.range.lowerBound)...Float(Self.range.upperBound),
                label: {},
                minimumValueLabel: {Text("\(Self.range.lowerBound)")},
                maximumValueLabel: {Text("\(Self.range.upperBound)")}
            )
                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)

            Button(action: {judgment()}, label: {Text("判定！")})
        }
        .alert("結果", isPresented: $isShowAlert,
               actions: {Button(action: {retry()}, label: {Text("再挑戦")})},
               message: {
            Text("\(isCorrectAnswer ? "あたり！" : "はずれ！")\nあなたの値：\(Int(inputValue))")
        })
    }

    private func judgment() {
        isCorrectAnswer = Int(inputValue) == targetValue
        isShowAlert = true
    }

    private func retry() {
        targetValue = Int.random(in: Self.range)
        inputValue = Float(Self.initialValue)
        isCorrectAnswer = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
