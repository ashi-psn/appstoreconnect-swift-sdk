//
//  File.swift
//  
//
//  Created by ashizawa on 2022/05/02.
//

import Foundation

import XCTest
@testable import AppStoreConnect_Swift_SDK

final class GetAppEventTests: XCTestCase {

    func testURLRequest() {
        
        let endpoind = APIEndpoint.appEvent(
            appEventId: "appEventId",
            fields: [AppEvent.Field.allCases],
            include: [AppEvent.Include.allCases]
        )
        
        let request = try? endpoint.asURLRequest()
        XCTAssertEqual(request?.httpMethod, "GET")

        let absoluteString = request?.url?.absoluteString
        let expected = "https://api.appstoreconnect.apple.com/v1/appEvents/appEventId?"
        XCTAssertEqual(absoluteString, expected)
    }
}
