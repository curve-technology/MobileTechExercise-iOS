//
//  CombineViewModel.swift
//  iOSScreeningTechTask
//
//  Created by Sam Watts on 16/06/2021.
//

import Foundation
import Combine

class CombineViewModel {
    // Assume that the view controller observes this value and reloads the table view when it changes
    // it will also delay slightly to handle willSet race conditions
    @Published var content: [Card] = []

    // API provides a combine fetching function
    // fetchCards() -> AnyPublisher<[Card], Error>
    let api: API = .init()

    // this will be called from a view controller in viewWillAppear
    func fetchContent() {
        #warning("missing implementation")
    }
}

