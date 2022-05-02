//
//  GetAppEvent.swift
//  AppStoreConnect-Swift-SDK
//
//  Created by ashizawa on 2022/05/02.
//

import Foundation


/// request to https://api.appstoreconnect.apple.com/v1/appEvents/{id}
/// response docs https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appevents_id
extension APIEndpoint where T == AppEventResposne {
    
    public static func appEvent(
        appEventId id: String,
        fields: [AppEvent.Field]? = nil,
        include: [AppEvent.Include]? = nil) -> APIEndpoint {
        var parameters = [String: Any]()
        if let fields = fields { parameters.add(fields) }
        if let include = include { parameters.add(include) }
        return APIEndpoint(
            path: "appEvents/\(id)",
            method: .get,
            parameters: parameters)
    }
}
