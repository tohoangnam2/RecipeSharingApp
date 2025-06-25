//
//  SessionManager.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 30/5/25.
//

import Foundation

final class SessionManager {
    static let shared = SessionManager()
    private init() {}

    var currentUser: User?
}
