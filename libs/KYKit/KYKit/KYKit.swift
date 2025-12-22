//
//  KYKit.swift
//  KYKit
//
//  Created by 박권용 on 12/22/25.
//

import Foundation

public struct SharedData {
    public static let shared = SharedData()
    
    private var appVersion: String = "1.0"
    
    public init() {}
    
    public func getAppversion() -> String {
        return appVersion
    }
}

