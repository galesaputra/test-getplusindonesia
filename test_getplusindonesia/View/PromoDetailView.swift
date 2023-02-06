//
//  PromoDetailView.swift
//  test_getplusindonesia
//
//  Created by Gale on 04/02/23.
//

import SwiftUI

struct PromoDetailView: View {
    var promoLink: String
    
    var body: some View {
        SwiftUIWebView(promoLink: promoLink)
    }
}
