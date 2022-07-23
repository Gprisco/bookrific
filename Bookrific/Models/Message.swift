//
//  Message.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 21/07/22.
//

import Foundation
import UIKit

public struct Message: Identifiable, Hashable {
    public static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
    
    public var id: Int
    public var from: UserProfile?
    public var message: String?
    public var attachments: [UIImage]?
}
