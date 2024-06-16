//
//  CachingManager.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 11/06/2024.
//

import Foundation

class CachingManager {
    
    private let cache = NSCache<NSString, AnyObject>()
    static let shared = CachingManager()
    
    private init() {}
    
    func getCachedData<T>(forKey key: String) -> T? {
        return cache.object(forKey: key as NSString) as? T
    }
    
    func cacheData<T>(_ data: T, forKey key: String) {
        cache.setObject(data as AnyObject, forKey: key as NSString)
    }
    
    func invalidateCache(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
}
