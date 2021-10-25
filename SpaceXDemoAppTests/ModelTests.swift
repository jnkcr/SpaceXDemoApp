//
//  ModelTests.swift
//  SpaceXDemoAppTests
//
//  Created by Jan Kučera on 25.10.2021.
//

import XCTest
@testable import SpaceXDemoApp


final class ModelTests: XCTestCase {
    
    let launchesOriginal: [LaunchModel] = [
        // Launch 1
        LaunchModel(id: "1", name: "Cecil", dateUTC: "2021-10-01T00:00:00.000Z", dateUnix: 1, dateLocal: "", datePrecision: .hour, flightNumber: 02, staticFireDateUTC: nil, staticFireDateUNIX: nil, tbd: false, net: false, window: nil, rocket: nil, failures: [], upcoming: false, details: nil, fairings: nil, crew: [], ships: [], capsules: [], payloads: [], launchpad: nil, cores: [], links: Links(patch: Patch(small: nil, large: nil), reddit: Reddit(campaign: nil, launch: nil, media: nil, recovery: nil), flickr: Flickr(small: [], original: []), presskit: nil, webcast: nil, youtubeId: nil, article: nil, wikipedia: nil), autoUpdate: false, success: false),
        // Launch 2
        LaunchModel(id: "2", name: "Alfred", dateUTC: "2021-10-03T00:00:00.000Z", dateUnix: 1, dateLocal: "", datePrecision: .hour, flightNumber: 01, staticFireDateUTC: nil, staticFireDateUNIX: nil, tbd: false, net: false, window: nil, rocket: nil, failures: [], upcoming: false, details: nil, fairings: nil, crew: [], ships: [], capsules: [], payloads: [], launchpad: nil, cores: [], links: Links(patch: Patch(small: nil, large: nil), reddit: Reddit(campaign: nil, launch: nil, media: nil, recovery: nil), flickr: Flickr(small: [], original: []), presskit: nil, webcast: nil, youtubeId: nil, article: nil, wikipedia: nil), autoUpdate: false, success: false),
        // Launch 3
        LaunchModel(id: "3", name: "Bob", dateUTC: "2021-10-02T00:00:00.000Z", dateUnix: 1, dateLocal: "", datePrecision: .hour, flightNumber: 03, staticFireDateUTC: nil, staticFireDateUNIX: nil, tbd: false, net: false, window: nil, rocket: nil, failures: [], upcoming: false, details: nil, fairings: nil, crew: [], ships: [], capsules: [], payloads: [], launchpad: nil, cores: [], links: Links(patch: Patch(small: nil, large: nil), reddit: Reddit(campaign: nil, launch: nil, media: nil, recovery: nil), flickr: Flickr(small: [], original: []), presskit: nil, webcast: nil, youtubeId: nil, article: nil, wikipedia: nil), autoUpdate: false, success: false)
    ]
    
    
    // MARK: Sorting by name
    func testSortingByName() {
        
        let listViewModel = ListViewModel(with: launchesOriginal)
        listViewModel.sortLaunches(by: 0)
        
        XCTAssertEqual(listViewModel.launches.first!.name, "Alfred")
        XCTAssertEqual(listViewModel.launches.last!.name, "Cecil")
        
    }
    
    func testSortingByDate() {
        
        let listViewModel = ListViewModel(with: launchesOriginal)
        listViewModel.sortLaunches(by: 1)
        
        XCTAssertEqual(listViewModel.launches.first!.dateUTC, "2021-10-03T00:00:00.000Z")
        XCTAssertEqual(listViewModel.launches.last!.dateUTC, "2021-10-01T00:00:00.000Z")
        
    }
    
    func testSortingByFlightNumber() {
        
        let listViewModel = ListViewModel(with: launchesOriginal)
        listViewModel.sortLaunches(by: 2)
        
        XCTAssertEqual(listViewModel.launches.first!.flightNumber, 01)
        XCTAssertEqual(listViewModel.launches.last!.flightNumber, 03)
        
    }
    
}
