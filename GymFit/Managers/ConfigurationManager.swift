//
//  ConfigurationManager.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 03/09/24.
//

import Foundation

class ConfigurationManager {
    static let shared = ConfigurationManager()
    
    private init() { }
    
    var faqURL: URL {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "FAQ_URL") as? String,
              let url = URL(string: urlString) else {
            fatalError("BASE_URL is not set or invalid")
        }
        return url
    }
    
    var facebookURL: URL {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "FACEBOOK_URL") as? String,
              let url = URL(string: urlString) else {
            fatalError("FACEBOOK_URL is not set or invalid")
        }
        return url
    }
    
    var instagramURL: URL {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "INSTAGRAM_URL") as? String,
              let url = URL(string: urlString) else {
            fatalError("INSTAGRAM_URL is not set or invalid")
        }
        return url
    }
    
    var cancelMembership: URL {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "COBRANZA_URL") as? String,
              let url = URL(string: urlString) else {
            fatalError("COBRANZA_URL is not set or invalid")
        }
        return url
    }
}
