//
//  CompletionViewModel.swift
//  iOSScreeningTechTask
//
//  Created by Sam Watts on 16/06/2021.
//

import Foundation

class CompletionViewModel {

    // The view controller will use this content to drive the table
    // (triggered when the fetchContent completion is called)
    private(set) var content: [Card] = []

    // API provides a completion closure
    // fetchCards(_ completion: @escaping (Result<[Card], Error>) -> Void)
    let api: API = .init()

    // this will be called from a view controller in viewWillAppear
    // the table view will reload when the completion block is called
    func fetchContent(_ completion: @escaping () -> Void) {
        #warning("missing implementation")
    }
}
