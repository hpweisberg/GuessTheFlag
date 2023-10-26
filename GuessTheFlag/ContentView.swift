//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Harrison Weisberg on 10/24/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionCounter = 1
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 600)                .ignoresSafeArea()
            VStack{
                Spacer()
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    HStack {
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .clipShape(.capsule)
                                    .shadow(radius: 5)
                            }
                        }            .background(Color.clear)
                            .buttonStyle(PlainButtonStyle())
                            .padding()
                            .hoverEffect()
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
            //        }
            .alert(scoreTitle, isPresented: $showingScore) {
                if questionCounter != 7 {
                    Button("Continue", action: askQuestion)
                } else {
                    Button("Restart game", action: restartGame)
                }
            } message: {
                if questionCounter != 7 {
                    Text("Your score is \(score)")
                } else {
                    Text("Your final score is \(score). To play again, click Restart game")
                }
            }
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCounter += 1
    }
    
    func restartGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCounter = 0
        score = 0
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
