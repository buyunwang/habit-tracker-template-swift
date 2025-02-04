//
//  Item.swift
//  habit tracker template
//
//  Created by Buyun Wang on 2025-01-09.
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
