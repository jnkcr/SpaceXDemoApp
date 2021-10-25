//
//  LunchModel.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 16.10.2021.
//

import Foundation

// MARK: - LaunchModel
struct LaunchModel: Codable, Identifiable {
    let id: String
    let name: String
    let dateUTC: String
    let dateUnix: Int
    let dateLocal: String
    let datePrecision: DatePrecision
    let flightNumber: Int
    let staticFireDateUTC: String?
    let staticFireDateUNIX: Int?
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
    let autoUpdate: Bool
    let success: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, tbd, net, window, rocket, failures, upcoming, details, fairings, crew, ships, capsules, payloads, launchpad, cores, links, success
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case flightNumber = "flight_number"
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUNIX = "static_fire_date_unix"
        case autoUpdate = "auto_update"
    }
}

// MARK: - DatePrecision
enum DatePrecision: String, Codable {
    case half
    case quarter
    case year
    case month
    case day
    case hour
}

// MARK: - Failures
struct Failures: Codable {
    let time: Int?
    let altitude: Int?
    let reason: String?
}

// MARK: - Crew
struct Crew: Codable {
    let crew: String?
    let role: String?
}

// MARK: - Core
struct Core: Codable {
    let core: String?
    let flight: Int?
    let gridfins: Bool?
    let legs: Bool?
    let reused: Bool?
    let landingAttempt: Bool?
    let landingSuccess: Bool?
    let landingType: String?
    let landpad: String?
    
    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused, landpad
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
    }
}

// MARK: - Links
struct Links: Codable {
    let patch: Patch
    let reddit: Reddit
    let flickr: Flickr
    let presskit: String?
    let webcast: String?
    let youtubeId: String?
    let article: String?
    let wikipedia: String?
    
    enum CodingKeys: String, CodingKey {
        case patch, reddit, flickr, presskit, webcast, article, wikipedia
        case youtubeId = "youtube_id"
    }
}

// MARK: - Patch
struct Patch: Codable {
    let small: String?
    let large: String?
}

// MARK: - Reddit
struct Reddit: Codable {
    let campaign: String?
    let launch: String?
    let media: String?
    let recovery: String?
}

// MARK: - Flickr
struct Flickr: Codable {
    let small: [String?]
    let original: [String?]
}

// MARK: - Fairings
struct Fairings: Codable {
    let reused: Bool?
    let recovery_attempt: Bool?
    let recovered: Bool?
    let ships: [String?]
}
