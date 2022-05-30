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
        
    }
    
    private init() {
        
    }
    
    // MARK: - Public
    public var watchList: [String] {
        return []
    }
    
    public func addToWatchList() {
        
    }
    
    public func removeFromWatchList() {
        
    }
    
    // MARK: - Public
    
    private var hasOnboarded: Bool {
        return false
    }
}
