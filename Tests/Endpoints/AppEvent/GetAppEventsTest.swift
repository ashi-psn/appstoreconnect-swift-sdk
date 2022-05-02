//
//  GetAppEventsTests.swift
//  
//
//  Created by ashizawa on 2022/05/02.
//

import XCTest
@testable import AppStoreConnect_Swift_SDK

final class GetAppEventsTests: XCTestCase {

    func testURLRequest() {
        
        let endpoind = APIEndpoint.appEvents(
            appId: "1",
            fields: [AppEvent.Field.allCases],
            filter: [AppEvent.Filter.allCases],
            include: [AppEvent.Field.App.allCases)],
            limit: 1
        )
        
        let request = try? endpoint.asURLRequest()
        XCTAssertEqual(request?.httpMethod, "GET")

        let absoluteString = request?.url?.absoluteString
        let expected = "https://api.appstoreconnect.apple.com/v1/apps/1/appEvents?"
        XCTAssertEqual(absoluteString, expected)
    }
}
