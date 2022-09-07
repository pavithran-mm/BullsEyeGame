//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by pavithran.mm on 07/09/22.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
    
    var sut : GameController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = GameController()
        sut.startNewGame()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    
    
    func testWhenStartNewGameIsCalledThenRoundShouldBeOneAndScoreShouldBeZero(){
        let initalValues = sut.getLabelValues()
        let round = initalValues["round"]!
        let score = initalValues["score"]!
        let expectedRound = 1
        let expectedScore = 0
        
        XCTAssertEqual(round, expectedRound)
        XCTAssertEqual(score, expectedScore)
    }
    
    
    func testWhenStartNewRoundIsCalledThenRoundShouldBeTwo(){
        let initalValues = sut.getLabelValues()
        let round = initalValues["round"]!
        let expectedRound = 2
            
        sut.startNewRound()
        
        let roundResult = sut.getLabelValues()["round"]
        XCTAssertTrue(round != roundResult)
        XCTAssertEqual(roundResult, expectedRound)
    }
    
    func testScoreShouldUpdateWhenWeUpdateTheSliderValueEqualToTheTargetValueAndScoreShouldBeTwoHundred(){
        let initalValue = sut.getLabelValues()
        let round = initalValue["round"]!
        let score = initalValue["score"]!
        
        sut.updateSliderValue(sliderValue: initalValue["target"]!)
        let (title, message) = sut.updateScore()
        sut.startNewRound()
        
        let resultValue = sut.getLabelValues()
        let resultRound = resultValue["round"]!
        let resultScore = resultValue["score"]!
        XCTAssertTrue(resultRound > round)
        XCTAssertTrue(resultScore != score)
        XCTAssertEqual(title, "Perfect!")
        XCTAssertEqual(message, "You have scored: 200")
        XCTAssertEqual(resultRound, 2)
        XCTAssertEqual(resultScore, 200)
    }
    
    func testScoreShouldUpdateWhenWeUpdateTheSliderValueAndThenTheScoreShouldBeOneFourNine(){
        sut.startNewGame()
        let initalValue = sut.getLabelValues()
        let round = initalValue["round"]!
        let score = initalValue["score"]!
        
        sut.updateSliderValue(sliderValue: initalValue["target"]! - 1)
        let (title, message) = sut.updateScore()
        sut.startNewRound()
        
        let resultValue = sut.getLabelValues()
        let resultRound = resultValue["round"]!
        let resultScore = resultValue["score"]!
        XCTAssertTrue(resultRound > round)
        XCTAssertTrue(resultScore > score)
        XCTAssertEqual(title, "Aaah!! Missed that!")
        XCTAssertEqual(message, "You have scored: 149")
        XCTAssertEqual(resultRound, 2)
        XCTAssertEqual(resultScore, 149)
    }
    
    func testScoreShouldUpdateWhenWeUpdateTheSliderValueAndThenTheScoreShouldBeOneTwoSix(){
        sut.startNewGame()
        let initalValue = sut.getLabelValues()
        let round = initalValue["round"]!
        let score = initalValue["score"]!
        
        sut.updateSliderValue(sliderValue: initalValue["target"]! - 4)
        let (title, message) = sut.updateScore()
        sut.startNewRound()
        
        let resultValue = sut.getLabelValues()
        let resultRound = resultValue["round"]!
        let resultScore = resultValue["score"]!
        XCTAssertTrue(resultRound > round)
        XCTAssertTrue(resultScore != score)
        XCTAssertEqual(title, "Almost There")
        XCTAssertEqual(message, "You have scored: 121")
        XCTAssertEqual(resultRound, 2)
        XCTAssertEqual(resultScore, 121)
    }
    
    func testScoreShouldUpdateWhenWeUpdateTheSliderValueAndThenTheScoreShouldBeNintyFour(){
        let initalValue = sut.getLabelValues()
        let round = initalValue["round"]!
        let score = initalValue["score"]!
        
        sut.updateSliderValue(sliderValue: initalValue["target"]! - 6)
        let (title, message) = sut.updateScore()
        sut.startNewRound()
        
        let resultValue = sut.getLabelValues()
        let resultRound = resultValue["round"]!
        let resultScore = resultValue["score"]!
        XCTAssertTrue(resultRound > round)
        XCTAssertTrue(resultScore != score)
        XCTAssertEqual(title, "Out of the way")
        XCTAssertEqual(message, "You have scored: 94")
        XCTAssertEqual(resultRound, 2)
        XCTAssertEqual(resultScore, 94)
    }
    
    func testScoreShouldUpdateWhenWeUpdateTheSliderValueAndThenTheScoreShouldBeEightyNine(){
        let initalValue = sut.getLabelValues()
        let round = initalValue["round"]!
        let score = initalValue["score"]!
        
        sut.updateSliderValue(sliderValue: initalValue["target"]! - 11)
        let (title, message) = sut.updateScore()
        sut.startNewRound()
        
        let resultValue = sut.getLabelValues()
        let resultRound = resultValue["round"]!
        let resultScore = resultValue["score"]!
        XCTAssertTrue(resultRound > round)
        XCTAssertTrue(resultScore != score)
        XCTAssertEqual(title, "Needs more precision")
        XCTAssertEqual(message, "You have scored: 89")
        XCTAssertEqual(resultRound, 2)
        XCTAssertEqual(resultScore, 89)
    }

}
