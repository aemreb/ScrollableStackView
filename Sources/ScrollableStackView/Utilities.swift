//
//  Utilities.swift
//  HTest
//
//  Created by Emre Boyacı on 29.06.2022.
//

import Foundation

public struct Utilities {
    @objc public enum PrivacyState: Int, RawRepresentable {
        case priv
        case pub
        
        public typealias RawValue = String
        
        public var rawValue: RawValue {
            switch self {
            case .priv:
                return "Private"
            case .pub:
                return "Public"
                
            }
        }
        
        public init?(rawValue: RawValue) {
            switch rawValue {
            case "DEBUG":
                self = .priv
            case "INFO":
                self = .pub
            default:
                return nil
            }
        }
    }
}
