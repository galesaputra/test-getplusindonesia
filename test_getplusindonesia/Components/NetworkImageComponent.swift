//
//  NetworkImageComponent.swift
//  test_getplusindonesia
//
//  Created by Gale on 05/02/23.
//

import SwiftUI

struct NetworkImage: View {
    var promoImageUrl: String
    var imageWidth: Double = 500
    var imageHeight: Double = 100
    var imageRadius: Double = 0
    
    var body: some View {
        AsyncImage(
            url: URL(string: promoImageUrl),
            content: { image in
                image.resizable()
                    .frame(maxWidth: imageWidth, maxHeight: imageHeight)
                    .cornerRadius(imageRadius)
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}

