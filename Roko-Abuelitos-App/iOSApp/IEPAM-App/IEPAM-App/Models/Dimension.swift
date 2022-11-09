//
//  Dimension.swift
//  IEPAM-App
//
//  Created by Sergio on 13/10/22.
//

import SwiftUI

struct Dimension: Identifiable {
    var id: Int
    var dimension: String
    
}

extension Dimension {
    static let dummy = Dimension(id: 1, dimension: "Social")
}
