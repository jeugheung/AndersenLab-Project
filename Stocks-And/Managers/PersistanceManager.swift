//
//  PersistanceManager.swift
//  Stocks-And
//
//  Created by Andrey Kim on 26.05.2022.
//

import Foundation

final class PersistanceManager {
    static let shared = PersistanceManager()
    
    private let userDefaults: UserDefaults = .standard
    
    private struct Constants {
        static let onboardedKey = "hasOnboarded"
        static let watchListKey = "watchList"
    }
    
    private init() {
        
    }
    
    // MARK: - Public
    public var watchList: [String] {
        if !hasOnboarded {
            userDefaults.set(true, forKey: "hasOnboarded")
            setUpDefaults()
        }
        return userDefaults.stringArray(forKey: Constants.watchListKey) ?? []
    }
    
    public func addToWatchList() {
        
    }
    
    public func removeFromWatchList(symbol: String) {
        var newList = [String]()
        userDefaults.set(nil, forKey: symbol)
        for item in watchList where item != symbol {
            print("\(item)")
            newList.append(item)
        }
        userDefaults.set(newList, forKey: Constants.watchListKey)
    }
    
    // MARK: - Public
    
    private var hasOnboarded: Bool {
        return userDefaults.bool(forKey: Constants.onboardedKey)
    }
    
    private func setUpDefaults() {
        let map: [String: String] = ["AAPL": "Apple inc", "MSFT": "Microsoft", "SNAP": "Snapchat"]
        
        let symbols = map.keys.map { $0 }
        userDefaults.set(symbols, forKey: Constants.watchListKey)
        
        for (symbol, name) in map {
            userDefaults.set(name, forKey: symbol)
        }
    }
}
