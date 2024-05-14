//
//  ContentView.swift
//  TCA_LBTA
//
//  Created by iMac on 14.05.2024.
//

import SwiftUI
import ComposableArtitecture

struct CounterView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack {
            Text("0")
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .clipShape(.rect(cornerRadius: 10))
            HStack {
                Button("-") {
                    store.send(.decrementButtonTapped)
                }
                .padding()
                .clipShape(.rect(cornerRadius: 10))
                
                Button("Reset") {
                    store.send(.resetButtonTapped)
                }
                .padding()
                .clipShape(.rect(cornerRadius: 10))
                
                Button("+") {
                    store.send(.incrementButtonTapped)
                }
                .padding()
                .clipShape(.rect(cornerRadius: 10))
            }
            
            Button(store.isTimerRunning ? "Stop timer" : "Start timer") {
                store.send(.toggleTimerButtonTapped)
            }
            .padding()
            .clipShape(.rect(cornerRadius: 10))
            
            Button("Fact") {
                store.send(.factButtonTapped)
            }
            .padding()
            .clipShape(.rect(cornerRadius: 10))
            
            if store.isLoading {
                ProgressView()
            } else if let fact = store.fact {
                Text(fact)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .font(.largeTitle)
        .background(Color.black.opacity(0.1))
    }
}

extension CounterFeature.State: Equatable {}

#Preview {
    CounterView(
        store: Store(initialState: CounterFeature.State()) {
            CounterFeature()
        }
    )
}
