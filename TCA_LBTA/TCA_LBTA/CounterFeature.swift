//
//  CounterFeature.swift
//  TCA_LBTA
//
//  Created by iMac on 14.05.2024.
//

import SwiftUI
import ComposableArtitecture

@Reducer
struct CounterFeature {
    struct State {
        var count = 0
        var fact: String?
        var isLoading = false
    }
    
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case resetButtonTapped
        case factButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                state.fact = nil
                return .none
            case .incrementButtonTapped:
                state.count += 1
                state.fact = nil
                return .none
            case .resetButtonTapped:
                state.count = 0
                state.fact = nil
                return .none
            case .factButtonTapped:
                state.fact = nil
                state.isLoading = true
                
                let (data, _) = try await URLSession.shared.data(
                    from: URL(string: "http://numbersapi.com/\(state.count)")!
                )
                // 🛑 'async' call in a function that does not support concurrency
                // 🛑 Errors thrown from here are not handled
                
                state.fact = String(decoding: data, as: UTF8.self)
                state.isLoading = false
                
                return .none
            }
        }
    }
}
