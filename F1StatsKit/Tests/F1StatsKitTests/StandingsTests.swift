//
//  StandingsTests.swift
//  
//
//  Created by Lorenzo Brescanzin on 28/03/23.
//

import XCTest
@testable import F1StatsKit

final class StandingsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDriversStandingsObjectInitializationFromJSONSuccess() throws {
        let jsonData = """
{
    "MRData": {
        "xmlns": "http://ergast.com/mrd/1.5",
        "series": "f1",
        "url": "http://ergast.com/api/f1/current/driverstandings.json",
        "limit": "30",
        "offset": "0",
        "total": "20",
        "StandingsTable": {
            "season": "2023",
            "StandingsLists": [
                {
                    "season": "2023",
                    "round": "2",
                    "DriverStandings": [
                        {
                            "position": "1",
                            "positionText": "1",
                            "points": "44",
                            "wins": "1",
                            "Driver": {
                                "driverId": "max_verstappen",
                                "permanentNumber": "33",
                                "code": "VER",
                                "url": "http://en.wikipedia.org/wiki/Max_Verstappen",
                                "givenName": "Max",
                                "familyName": "Verstappen",
                                "dateOfBirth": "1997-09-30",
                                "nationality": "Dutch"
                            },
                            "Constructors": [
                                {
                                    "constructorId": "red_bull",
                                    "url": "http://en.wikipedia.org/wiki/Red_Bull_Racing",
                                    "name": "Red Bull",
                                    "nationality": "Austrian"
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    }
}
""".data(using: .utf8)
        let standing = StandingItem(
            position: 1,
            points: 44,
            wins: 1,
            competitor: Driver(
                firstName: "Max",
                lastName: "Verstappen",
                code: "VER"
            )
        )
        
        let decodedJSON = try JSONDecoder().decode(Response<[StandingsWrapper<StandingItem<Driver>>]>.self, from: jsonData!)
        
        XCTAssertEqual(decodedJSON.content[0].standing[0], standing)
    }
}
