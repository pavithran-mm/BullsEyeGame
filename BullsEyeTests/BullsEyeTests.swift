//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by pavithran.mm on 07/09/22.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
    
    var sut : ViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testStartNewRoundWhenCalledThenScoreShouldBeZeroAndRoundShouldBeOne(){
        let randomValue = sut.randomValue
        let targetLabel = UILabel()
        let scoreLabel = UILabel()
        let roundLabel = UILabel()
        let slider = UISlider()
        sut.slider = slider
        sut.roundLabel = roundLabel
        sut.scoreLabel = scoreLabel
        sut.targetLabel = targetLabel
        
        sut.startNewRound()
        
        XCTAssertEqual(sut.round, 1)
        XCTAssertEqual(sut.currentSliderValue, 50)
        XCTAssertEqual(sut.score, 0)
        XCTAssertTrue(randomValue != sut.randomValue)
    }
    
    func testPointsAndDifferenceWhenSliderValueIsEqualToRandomValueThenPointsShouldBeHundredAndDifferenceShouldBeZero() {
        sut.currentSliderValue = sut.randomValue
        let points : (points: Int, difference:Int) = sut.calculatePointsDifference()
        
        XCTAssertEqual(points.0, 100)
        XCTAssertEqual(points.1, 0)
    }
    
    func testBonusPointsAndTitleWhenGivenDifferenceOfZeroThenBonusShouldBeHundred(){
        let result : (title:String, points: Int ) = sut.getBonusAndTitle(0)
        
        XCTAssertEqual(result.0, "Perfect!!!")
        XCTAssertEqual(result.1, 100)
    }
    
    func testBonusPointsAndTitleWhenGivenDifferenceOfOneThenBonusShouldBeFifty(){
        let result : (title:String, points: Int ) = sut.getBonusAndTitle(1)
        
        XCTAssertEqual(result.0, "Aaahh!! Missed that!!")
        XCTAssertEqual(result.1, 50)
    }
    
    func testBonusPointsAndTitleWhenGivenDifferenceOfFourThenBonusShouldBeTwentyFive(){
        let result : (title:String, points: Int ) = sut.getBonusAndTitle(4)
        
        XCTAssertEqual(result.0, "Almost there!")
        XCTAssertEqual(result.1, 25)
    }


}
