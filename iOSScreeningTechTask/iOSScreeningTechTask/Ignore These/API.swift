//
//  API.swift
//  iOSScreeningTechTask
//
//  Created by Sam Watts on 16/06/2021.
//

import Foundation
import Combine

class API {

    func fetchCards(fail: Bool = false) -> AnyPublisher<[Card], Error> {

        if fail {
            return Fail(
                outputType: [Card].self,
                failure: NSError(
                    domain: "com.curve.app",
                    code: .random(in: 0 ..< 100),
                    userInfo: nil
                )
            )
            .delay(for: 0.5, scheduler: DispatchQueue.global(qos: .background))
            .eraseToAnyPublisher()
        } else {
            return Just(.mock)
                .delay(for: 0.5, scheduler: DispatchQueue.global(qos: .background))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }

    func fetchCards(fail: Bool = false, _ completion: @escaping (Result<[Card], Error>) -> Void) {

        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.5) {
            if fail {
                completion(
                    .failure(
                        NSError(
                            domain: "com.curve.app",
                            code: .random(in: 0 ..< 100),
                            userInfo: nil
                        )
                    )
                )
            } else {
                completion(.success(.mock))
            }
        }
    }
}
