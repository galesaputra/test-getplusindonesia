//
//  image_component.swift
//  test_getplusindonesia
//
//  Created by Gale on 03/02/23.
//

import SwiftUI

struct ButtonImage: View {
    var image: String
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            Image(image)
                .resizable()
                .frame(width: 40.0, height: 40.0)
        }
        
    }
}
