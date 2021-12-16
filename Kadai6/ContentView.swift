//
//  ContentView.swift
//  Kadai6
//
//  Created by mana on 2021/12/16.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 1...100)
    @State private var inputValue: Float = 50
    @State private var isCorrectAnswer = false
    @State private var isShowAlert = false

    var body: some View {
        VStack(spacing: 50.0) {
            Text("\(targetValue)")
                .font(.largeTitle)

            Slider(value: $inputValue, in: 1...100,
                   label: {}, minimumValueLabel: {Text("1")}, maximumValueLabel: {Text("100")})
                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)

            Button(action: {judgment()}, label: {Text("判定！")})
        }
        .alert("結果", isPresented: $isShowAlert,
               actions: {Button(action: {retry()}, label: {Text("再挑戦")})},
               message: {isCorrectAnswer ?
            Text("あたり！\nあなたの値：\(Int(inputValue))") : Text("はずれ！\nあなたの値：\(Int(inputValue))")})
    }

    private func judgment() {
        if Int(inputValue) == targetValue {
            isCorrectAnswer = true
        }
        isShowAlert = true
    }

    private func retry() {
        targetValue = Int.random(in: 1...100)
        inputValue = 50
        isCorrectAnswer = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
