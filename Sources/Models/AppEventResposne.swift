//
//  AppEventResposne.swift
//  AppStoreConnect-Swift-SDK
//  
//
//  Created by ashizawa on 2022/05/01.
//

import Foundation

// response object /v1/appEvents/{id}
// https://developer.apple.com/documentation/appstoreconnectapi/appeventresponse
public struct AppEventResposne: Codable {
    /// App Event Object
    public var data: AppEvent
    
    /// DocumentLinks
    public var links: Links
    
    
    
    /// AppEvent Object
    public struct AppEvent: Codable {
        
        /// 
        var type: String
        
        /// app event id
        var id: Int
        
        /// app event
        var attributes: Attributes
        
        /// app event details
        public struct Attributes: Codable {
            
            public enum Badge: String, Codable {
                case LIVE_EVENT, PREMIERE, CHALLENGE, COMPETITION, NEW_SEASON, MAJOR_UPDATE, SPECIAL_EVENT
            }
            
            public enum EventState: String, Codable {
                case DRAFT, READY_FOR_REVIEW, WAITING_FOR_REVIEW, IN_REVIEW, REJECTED, ACCEPTED, APPROVED, PUBLISHED, PAST, ARCHIVED
            }
            
            public enum PurchaseRequirement: String, Codable {
                case NO_COST_ASSOCIATED, IN_APP_PURCHASE, SUBSCRIPTION, IN_APP_PURCHASE_AND_SUBSCRIPTION, IN_APP_PURCHASE_OR_SUBSCRIPTION
            }
            
            public enum Priority: String, Codable {
                case HIGH, NORMAL
            }
            
            public enum Purpose: String, Codable {
                case APPROPRIATE_FOR_ALL_USERS, ATTRACT_NEW_USERS, KEEP_ACTIVE_USERS_INFORMED, BRING_BACK_LAPSED_USERS
            }
            
            public struct TerritorySchedules: Codable {
                public var eventEnd: String
                public var eventStart: String
                public var publishStart: String
                public var territories: [String]
                
            }
            
            /// app event title
            public var referenceName: String
            
            /// app event badge type
            public var badge: Badge
            
            /// app event deeplink
            public var deepLink: String
            
            // app event event stae
            public var eventState: EventState
            
            public var purchaseRequirement: PurchaseRequirement
            public var primaryLocale: String
            public var priority: Priority
            public var purpose: Purpose
            
            var territorySchedules: [TerritorySchedules]
        }
    }
    
    public struct Links: Codable {

        /// uri-reference
        public let related: URL?

        /// uri-reference
        public let `self`: URL?
    }
    
}
