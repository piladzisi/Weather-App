//
//  DarkSkyError.swift
//  Stormy
//
//  Created by anna.sibirtseva on 17/04/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessfull(statusCode: Int)
    case invalidData
    case jsonParsingFailure
    case invalidUrl
}
