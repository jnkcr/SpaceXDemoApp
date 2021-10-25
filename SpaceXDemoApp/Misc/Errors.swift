//
//  Errors.swift
//  SpaceXDemoApp
//
//  Created by Jan Kučera on 23.10.2021.
//

import Foundation


enum LaunchesError: String, Error {
    case dataCorrupted = "Downloaded data might be corrupted, please try downloading launches again."
    case unableToParseData = "Downloaded data were not processed correctly, please try downloading launches again."
    case failedToDownloadData = "Unable to download data from server, please check your internet connection and try downloading data again."
}
