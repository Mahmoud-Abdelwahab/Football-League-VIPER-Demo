//
//  PlayerSquadTest.swift
//  Football-LeagueTests
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//

import XCTest
@testable import Football_League

class PlayerSquadTest: XCTestCase {
    var remoteLeagueTeamsWorker = RemoteLeagueTeamsWorker()

    func testGetTeamInto() throws {
    
        let errorExpectation = expectation(description: "No Squad")
        var  count = 0

        remoteLeagueTeamsWorker.getTeamInfo(teamId: 50) { result in
                switch result{
                case .success(let team):
                    count = team.squad!.count
                    errorExpectation.fulfill()
                case .failure(let error):
                   print(error)
                }
            }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertGreaterThan(count, 0)
        }
    }

}
