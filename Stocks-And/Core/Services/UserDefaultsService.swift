//
//  UserDefaultsService.swift
//  Stocks-And
//
//  Created by Andrey Kim on 26.05.2022.
//

import Foundation

final class UserDefaultsService {
    static let shared = UserDefaultsService()
    
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
    
    public func watchListContains(symbol: String) -> Bool {
        return watchList.contains(symbol) 
    }
    
    public func addToWatchList(symbol: String, companyName: String) {
        var current = watchList
        current.append(symbol)
        userDefaults.set(current, forKey: Constants.watchListKey)
        userDefaults.set(companyName, forKey: symbol)
        
        NotificationCenter.default.post(name: .didAddToWatchList, object: nil)
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
    
    // MARK: - Private
    
    private var hasOnboarded: Bool {
        return userDefaults.bool(forKey: Constants.onboardedKey)
    }
    
    private func setUpDefaults() {
        let map: [String: String] = ["AAPL": "Apple inc", "MSFT": "Microsoft", "SNAP": "Snapchat",
                                     "NKE": "Nike inc", "NVDA": "Nvidia", "SBUX": "Starbucks",
                                     "GE": "General Electric", "DIS": "Walt Disney"]
        
        let symbols = map.keys.map { $0 }
        userDefaults.set(symbols, forKey: Constants.watchListKey)
        
        for (symbol, name) in map {
            userDefaults.set(name, forKey: symbol)
        }
    }
}
