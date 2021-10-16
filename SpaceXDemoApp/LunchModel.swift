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
//    let fairings
//    let crew
    let ships: [String?]
    let capsules: [String?]
    let payloads: [String?]
    let launchpad: String?
//    let cores
//    let links
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
