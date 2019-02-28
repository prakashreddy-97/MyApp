//
//  Guesser.swift
//  GuessingApp
//
//  Created by student on 2/27/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class Guesser{
    
        private var correctAnswer:Int
        private var _numAttempts:Int
        public var guesses:[Guess]
        struct Guess {
            var correctAnswer:Int
            var numAttemptsRequired:Int
    }
    var numAttempts:Int{
        return _numAttempts
    }
    private init(){
        self.correctAnswer = 0
        self._numAttempts = 0
        self.guesses = []
    }
    static var shared = Guesser()
        
    func createNewProblem(){
        correctAnswer = Int.random(in: 0...10)
        _numAttempts = 0
    }
    
    func amIRight(guess:Int) -> Result {
        _numAttempts = _numAttempts + 1
        if guess == correctAnswer {
            guesses.append(Guess(correctAnswer: correctAnswer, numAttemptsRequired: _numAttempts))
            return Result.correct
        }else if guess > correctAnswer{
            return Result.tooHigh
        }else{
            return Result.tooLow
        }
    }
    
    func guess(index: Int) -> Guess {
        return guesses[index]
    }
    subscript(guess:Int)->Guess{
        return guesses[guess]
    }
    
    func numGuesses() -> Int {
        return guesses.count
    }
    
    func clearStatistics() {
        guesses = []
    }
    
    func minimumNumAttempts() -> Int {
        if guesses.isEmpty{
            return 0
        }else{
            var min = guesses[0].numAttemptsRequired
            for i in guesses{
                if i.numAttemptsRequired < min{
                    min = i.numAttemptsRequired
                }
            }
            return min
        }
    }
    
    func maximumNumAttempts() -> Int {
        if guesses.isEmpty{
            return 0
        }else{
            var max = guesses[0].numAttemptsRequired
            for i in guesses{
                if i.numAttemptsRequired > max{
                    max = i.numAttemptsRequired
                }
            }
            return max
        }
    }
    
    func mean() -> Double {
        if guesses.isEmpty{
            return 0
        }else{
            var mean = 0.0
            var sum = 0.0
            for i in guesses{
                sum = sum + Double(i.numAttemptsRequired)
            }
            mean = sum/Double(numGuesses())
            return mean
        }
    }
    func  stdDev() -> Double {
        if guesses.isEmpty{
            return 0
        }else{
            var sum = 0.0
            var std = 0.0
            for i in guesses{
                sum = sum+pow(Double(i.numAttemptsRequired)-mean(), 2)
            }
            std = sqrt(sum/Double(numGuesses()))
            return std
        }
    }
    
    
}
    enum Result:String {case tooLow = "Too Low", tooHigh = "Too High", correct = "Correct"}


