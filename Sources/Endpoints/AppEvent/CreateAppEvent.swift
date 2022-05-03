//
//  File.swift
//  
//
//  Created by ashizawa on 2022/05/03.
//

import Foundation

/// request to https://api.appstoreconnect.apple.com/v1/appEvents/{id}
/// response docs https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appevents_id
extension APIEndpoint where T == AppEventResposne {

    public static func create(
        badge: AppEventCreateRequest.Data.Attributes.Badge? = nil,
        deepLink: String? = nil,
        primaryLocale: String? = nil,
        purchaseRequirement: AppEventCreateRequest.Data.Attributes.PurchaseRequirement? = nil,
        purpose: AppEventCreateRequest.Data.Attributes.Purpose? = nil,
        priority: AppEventCreateRequest.Data.Attributes.Priority? = nil,
        referenceName: String,
        territorySchedules: [AppEventCreateRequest.Data.Attributes.TerritorySchedules]? = nil,
        relationshipsAppId: String) -> APIEndpoint {

        let body = AppEventCreateRequest(
            badge: badge,
            deepLink: deepLink,
            primaryLocale: primaryLocale,
            purchaseRequirement: purchaseRequirement,
            purpose: purpose,
            priority: priority,
            referenceName: referenceName,
            territorySchedules: territorySchedules,
            relationshipsAppId: relationshipsAppId)

        return APIEndpoint(
            path: "appEvents",
            method: .post,
            parameters: nil,
            body: try? JSONEncoder().encode(body))
    }
}
