//
//  Football_LeagueTests.swift
//  Football-LeagueTests
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//

import XCTest
@testable import Football_League

class Football_LeagueTests: XCTestCase {

    var remoteLeagueTeamsWorker = RemoteLeagueTeamsWorker()
    func testGetPremierLeagueExample()throws{
        let guess = 20
        let errorExpectation = expectation(description: "error")
        var  count = 0
        remoteLeagueTeamsWorker.getPremierLeagueTeamList { result in
            switch result{
            case .success(let teamList):
                count = teamList.teams!.count
                errorExpectation.fulfill()
            case .failure(let error):
            
              print(error)
                errorExpectation.fulfill()
            }
        }
            waitForExpectations(timeout: 10) { error in
                XCTAssertEqual(guess, count, "****Error***")
            }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
