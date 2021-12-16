//
//  ContentView.swift
//  Kadai6
//
//  Created by mana on 2021/12/16.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var judgement = Judgement()
    @State private var inputValue: Float = 50
    @State private var isShowAlert = false

    var body: some View {
        VStack(spacing: 50.0) {
            Text("\(judgement.targetValue)")
                .font(.largeTitle)
            Text("入力値\(Int(inputValue))")
            Slider(value: $inputValue, in: 1...100,
                   label: {}, minimumValueLabel: {Text("1")}, maximumValueLabel: {Text("100")})
                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)

            Button(action: {
                judgement.result(inputValue: inputValue)
                isShowAlert = true
            }, label: {Text("判定！")})
        }
        .alert("結果", isPresented: $isShowAlert,
               actions: {Button(action: {judgement.retry();inputValue = 50},
                                label: {Text("再挑戦")})},
               message: {judgement.isCorrectAnswer ?
            Text("あたり！\nあなたの値：\(Int(inputValue))") : Text("はずれ！\nあなたの値：\(Int(inputValue))")})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
