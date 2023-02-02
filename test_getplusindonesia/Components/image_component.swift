//
//  image_component.swift
//  test_getplusindonesia
//
//  Created by Gale on 03/02/23.
//

import SwiftUI

struct ButtonImage: View {
    var body: some View {
        Button(action: {}) {
            Image("image_vouchers")
                .resizable()
                .frame(width: 40.0, height: 40.0)
        }
        
    }
}
