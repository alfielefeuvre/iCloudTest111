//
//  DayData1.swift
//  iCloudTest111
//
//  Created by Alfie Le Feuvre on 18/08/2024.
//

import Foundation
import SwiftData

@Model
final class DayData1 {
    var timestamp: Date = Date(timeIntervalSince1970: 100_000)
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
