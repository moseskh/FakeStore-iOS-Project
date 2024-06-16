//
//  NetworkManager.swift
//  FakeStore-iOS-Project
//
//  Created by Moses Kh. on 16/06/2024.
//

import Network

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    
    var onStatusChange: ((Bool) -> Void)?
    
    private init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            let isConnected = path.status == .satisfied
            self.onStatusChange?(isConnected)
        }
        monitor.start(queue: queue)
    }
}
