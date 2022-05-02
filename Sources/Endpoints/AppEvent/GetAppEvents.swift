//
//  GetAppEvents.swift
//  AppStoreConnect-Swift-SDK
//  
//
//  Created by ashizawa on 2022/05/02.
//

import Foundation

extension APIEndpoint where T == AppEventsResposne {
    
    public static func appEvents(
        appId id: String,
        fields: [AppEvent.Field]? = nil,
        filter: [AppEvent.Filter]? = nil,
        include: [AppEvent.Include]? = nil,
        limit: Int? = nil) -> APIEndpoint {
        var parameters = [String: Any]()
        if let fields = fields { parameters.add(fields) }
        if let filter = filter { parameters.add(filter) }
        if let include = include { parameters.add(include) }
        if let limit = limit { parameters["limit"] = limit }
        return APIEndpoint(
            path: "apps/\(id)/appEvents",
            method: .get,
            parameters: parameters)
    }
    
}


public enum AppEvent {
    
    /// Fields to return for included related types.
    public enum Field: NestableQueryParameter {
        case appEventLocalizations([AppEventLocalizations])
        case appEvents([AppEventFieldValue])
        static var key: String = "fields"
        var pair: Pair {
            switch self {
            case .appEventLocalizations(let value):
                return (AppEventLocalizations.key, value.map({ $0.pair.value }).joinedByCommas())
                
            case .appEvents(let value):
                return (AppEventFieldValue.key, value.map({ $0.pair.value }).joinedByCommas())
            }
        }
    }
    
    public enum Filter: NestableQueryParameter {
        case eventState([EventState])
        case id([String])
        
        static var key: String = "include"
        
        var pair: Pair {
            switch self {
            case .eventState(let value):
                return (EventState.key, value.map({ $0.pair.value }).joinedByCommas())
            case .id(let value):
                return ("id", value.joinedByCommas())
            }
        }
    }
    
    // Relationship data to include in the response.
    public enum Include: String, CaseIterable, NestableQueryParameter {
        case localizations

        static var key: String = "include"
        var pair: NestableQueryParameter.Pair { return (nil, rawValue) }
    }

    /// Number of resources to return.
    public enum Limit: NestableQueryParameter {

        /// Maximum: 200
        case appevents(Int)

        static var key: String = "limit"
        var pair: Pair {
            switch self {
            case .appevents(let value):
                return (nil, "\(value)")
            }
        }
    }
}

extension AppEvent.Field {
    
    public enum AppEventLocalizations: String, CaseIterable, NestableQueryParameter {
        case appEvent, appEventScreenshots, appEventVideoClips, locale, longDescription, name, shortDescription
        
        static var key: String = "appEventLocalizations"
        var pair: NestableQueryParameter.Pair { return (nil, rawValue) }
    }
    
    public enum AppEventFieldValue: String, CaseIterable, NestableQueryParameter {
        case app, archivedTerritorySchedules, badge, deepLink, eventState, localizations, primaryLocale, priority, purchaseRequirement, purpose, referenceName, territorySchedules
        
        static var key: String = "appEvents"
        var pair: NestableQueryParameter.Pair { return (nil, rawValue) }
    }
}

extension AppEvent.Filter {
    
    public enum EventState: String, CaseIterable, NestableQueryParameter {
        case DRAFT, READY_FOR_REVIEW, WAITING_FOR_REVIEW, IN_REVIEW, REJECTED, ACCEPTED, APPROVED, PUBLISHED, PAST, ARCHIVED
        
        static var key: String = "eventState"
        var pair: NestableQueryParameter.Pair { return (nil, rawValue) }
        
    }
}
