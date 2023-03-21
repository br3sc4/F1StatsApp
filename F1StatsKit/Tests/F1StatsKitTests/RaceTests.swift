//
//  RaceTests.swift
//  
//
//  Created by Lorenzo Brescanzin on 21/03/23.
//

import XCTest
@testable import F1StatsKit

final class RaceTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRaceObjectInitializationSuccess() throws {
        guard let json = """
{
    "round": "1",
    "raceName": "Bahrain Grand Prix",
    "date": "2023-03-05",
    "time": "15:00:00Z"
}
""".data(using: .utf8) else { return }
        
        let decoder = JSONDecoder()
        let race = try decoder.decode(Race.self, from: json)
        
        XCTAssertEqual(race.date, ISO8601DateFormatter().date(from: "2023-03-05T15:00:00Z"))
    }
    
}
