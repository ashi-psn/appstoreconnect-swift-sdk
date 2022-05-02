//
//  AppEventResposne.swift
//  AppStoreConnect-Swift-SDK
//
//
//  Created by ashizawa on 2022/05/01.
//

import Foundation

// response object /v1/apps/{id}/appEvents
// GET https://developer.apple.com/documentation/appstoreconnectapi/appeventresponse
public struct AppEventsResposne: Codable {
    public let data: [AppEventResposne.AppEvent]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation
}
