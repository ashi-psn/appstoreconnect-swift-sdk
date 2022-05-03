//
//  File.swift
//  
//
//  Created by ashizawa on 2022/05/03.
//

import Foundation

// response object /v1/appEvents/{id}
// https://developer.apple.com/documentation/appstoreconnectapi/appeventresponse
public struct AppEventCreateRequest: Codable {
    
    public struct Data: Codable {
        public let attributes: AppEventCreateRequest.Data.Attributes
        public let relationships: AppEventCreateRequest.Data.Relationships
        public var type = "appEvents"
    }
    
    public let data: AppEventCreateRequest.Data
    
    init(
        badge: AppEventCreateRequest.Data.Attributes.Badge? = nil,
        deepLink: String? = nil,
        primaryLocale: String? = nil,
        purchaseRequirement: AppEventCreateRequest.Data.Attributes.PurchaseRequirement? = nil,
        purpose: AppEventCreateRequest.Data.Attributes.Purpose? = nil,
        priority: AppEventCreateRequest.Data.Attributes.Priority? = nil,
        referenceName: String,
        territorySchedules: [AppEventCreateRequest.Data.Attributes.TerritorySchedules]? = nil,
        relationshipsAppId: String){
            data = .init (
                attributes: .init(
                    badge: badge,
                    deepLink: deepLink,
                    primaryLocale: primaryLocale,
                    purchaseRequirement: purchaseRequirement,
                    purpose: purpose,
                    priority: priority,
                    referenceName: referenceName,
                    territorySchedules: territorySchedules),

                relationships: .init(
                    app: .init(
                        data: .init(
                            id: relationshipsAppId,
                            app: "apps")
                    )
                ),
                type: "appEvents"
        )
    }
}

extension AppEventCreateRequest.Data {
    public struct Attributes: Codable {
        
        public enum Badge: String, Codable {
            case LIVE_EVENT, PREMIERE, CHALLENGE, COMPETITION, NEW_SEASON, MAJOR_UPDATE, SPECIAL_EVENT
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
            public let eventEnd: String
            public let eventStart: String
            public let publishStart: String
            public let territories: [String]
        }
        
        
        
        /// app event badge type
        public let badge: Badge?
        
        /// app event deeplink
        public let deepLink: String?
        
        public let primaryLocale: String?
        
        
        public let purchaseRequirement: PurchaseRequirement?
        
        public let purpose: Purpose?
        
        
        public let priority: Priority?
        
        /// app event title
        public let referenceName: String
        
        public let territorySchedules: [TerritorySchedules]?
    }
}

extension AppEventCreateRequest.Data {
    public struct Relationships: Codable {
        public let app: AppEventCreateRequest.Data.Relationships.App
    }
}

extension AppEventCreateRequest.Data.Relationships {
    public struct App: Codable {
        public let data: AppEventCreateRequest.Data.Relationships.App.Data
    }
}

extension AppEventCreateRequest.Data.Relationships.App {
    public struct Data: Codable {
        public let id: String
        public var app: String = "apps"
    }
}
