//
//  Card.swift
//  iOSScreeningTechTask
//
//  Created by Sam Watts on 16/06/2021.
//

import Foundation

struct Card {
    let id: UUID
    let name: String
    let balance: Double
}

extension Array where Element == Card {
    static let mock: [Card] = [
        .init(id: UUID(), name: "Curve Cash", balance: 100.00),
        .init(id: UUID(), name: "Monzo", balance: 2000),
        .init(id: UUID(), name: "Revolut", balance: 0)
    ]
}
