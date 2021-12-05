//
//  AutoLocateResponse.swift
//  HW_9-CSCI-571
//
//  Created by Eshan Bhargava on 12/4/21.
//

import SwiftUI

// helps us with getting id of data
struct AutoLocateResponse: Identifiable {
    var id: Int
    var date: String
    var weatherCode: Int
    var sunRiseTime: String
    var sunSetTime: String
}
