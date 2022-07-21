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
        if ad != nil {
            return Text("\(ad!.id.uuidString)")
        }
        
        return Text("Seleziona un'inserzione")
    }
}

struct AdDetails_Previews: PreviewProvider {
    static var previews: some View {
        AdDetails(ad: Binding(get: { Ad(lat: 43.0, long: 11.0, author: "Philip Knight", title: "L'arte della Vittoria", description: "Libro meraviglioso") }, set: {_ in}))
    }
}
