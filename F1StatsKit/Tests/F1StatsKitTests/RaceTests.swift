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

    func testRaceObjectInitializationFromJSONSuccess() throws {
        guard let json = """
        {
            "MRData": {
                "xmlns": "http://ergast.com/mrd/1.5",
                "series": "f1",
                "url": "http://ergast.com/api/f1/current.json",
                "limit": "30",
                "offset": "0",
                "total": "23",
                "RaceTable": {
                    "season": "2023",
                    "Races": [
                        {
                            "season": "2023",
                            "round": "1",
                            "url": "https://en.wikipedia.org/wiki/2023_Bahrain_Grand_Prix",
                            "raceName": "Bahrain Grand Prix",
                            "Circuit": {
                                "circuitId": "bahrain",
                                "url": "http://en.wikipedia.org/wiki/Bahrain_International_Circuit",
                                "circuitName": "Bahrain International Circuit",
                                "Location": {
                                    "lat": "26.0325",
                                    "long": "50.5106",
                                    "locality": "Sakhir",
                                    "country": "Bahrain"
                                }
                            },
                            "date": "2023-03-05",
                            "time": "15:00:00Z"
                        }
                    ]
                }
            }
        }
        """.data(using: .utf8) else { return }
        
        let expectedResult: [Race] = [
            Race(name: "Bahrain Grand Prix",
                 round: "1",
                 date: ISO8601DateFormatter().date(from: "2023-03-05T15:00:00Z")!,
                 circuit: .init(id: "bahrain",
                                name: "Bahrain International Circuit",
                                location: .init(longitude: "50.5106",
                                                latitude: "26.0325",
                                                locality: "Sakhir",
                                                country: "Bahrain"
                                               )
                               )
                )
        ]
        
        let decoder = JSONDecoder()
        let races = try decoder.decode(Response<Race>.self, from: json)
        
        XCTAssertEqual(races.content, expectedResult)
    }
    
}
