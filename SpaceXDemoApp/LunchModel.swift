//
//  LunchModel.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 16.10.2021.
//

import Foundation


struct LunchModel: Codable, Identifiable {
    let id: String
    let name: String
    let date_utc: String
    let date_unix: Int
    let date_local: String
    let date_precision: DatePrecision
    let static_fire_date_utc: String?
    let static_fire_date_unix: Int?
    let tbd: Bool
    let net: Bool
    let window: Int?
    let rocket: String?
    let failures: [Failures]
    let upcoming: Bool
    let details: String?
    let fairings: Fairings?
    let crew: [Crew]
    let ships: [String?]
    let capsules: [String?]
    let payloads: [String?]
    let launchpad: String?
    let cores: [Core]
    let links: Links
    let auto_update: Bool
    let success: Bool
    
}

enum DatePrecision: String, Codable {
    case half
    case quarter
    case year
    case month
    case day
    case hour
}

struct Failures: Codable {
    let time: Int?
    let altitude: Int?
    let reason: String?
}

struct Crew: Codable {
    let crew: String?
    let role: String?
}

struct Core: Codable {
    let core: String?
    let flight: Int?
    let gridfins: Bool?
    let legs: Bool?
    let reused: Bool?
    let landing_attempt: Bool?
    let landing_success: Bool?
    let landing_type: String?
    let landpad: String?
}

struct Links: Codable {
    let patch: Patch
    let reddit: Reddit
    let flickr: Flickr
    let presskit: String?
    let webcast: String?
    let youtube_id: String?
    let article: String?
    let wikipedia: String?
}

struct Patch: Codable {
    let small: String?
    let large: String?
}

struct Reddit: Codable {
    let campaign: String?
    let launch: String?
    let media: String?
    let recovery: String?
}

struct Flickr: Codable {
    let small: [String?]
    let original: [String?]
}

struct Fairings: Codable {
    let reused: Bool?
    let recovery_attempt: Bool?
    let recovered: Bool?
    let ships: [String?]
}
