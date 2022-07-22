//
//  AdDetails.swift
//  Bookrific
//
//  Created by Giovanni Prisco on 21/07/22.
//

import SwiftUI

struct AdDetails: View {
    @Binding var ad: Ad?
    
    var body: some View {
        Text("\(ad!.id.uuidString)")
    }
}

struct AdDetails_Previews: PreviewProvider {
    static var previews: some View {
        AdDetails(ad: Binding(get: { Ad(lat: 43.0, long: 11.0, author: "Philip Knight", title: "L'arte della Vittoria", description: "Libro meraviglioso", user: UserProfile(id: 1, name: "John", surname: "Doe")) }, set: {_ in}))
    }
}
