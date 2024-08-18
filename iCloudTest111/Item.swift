//
//  Item.swift
//  iCloudTest111
//
//  Created by Alfie Le Feuvre on 18/08/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
