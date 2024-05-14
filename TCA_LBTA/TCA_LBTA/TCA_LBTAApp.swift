//
//  TCA_LBTAApp.swift
//  TCA_LBTA
//
//  Created by iMac on 14.05.2024.
//

import Comp
import SwiftUI

@main
struct TCA_LBTAApp: App {
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: TCA_LBTAApp.store)
        }
    }
}
