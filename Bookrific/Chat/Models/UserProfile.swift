//
//  UserProfile.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 21/07/22.
//

import Foundation

public struct UserProfile: Identifiable, Hashable {
    public var id: Int
    public var name: String
    public var surname: String
}
