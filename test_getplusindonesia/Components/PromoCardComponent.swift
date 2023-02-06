//
//  PromoCardComponent.swift
//  test_getplusindonesia
//
//  Created by Gale on 04/02/23.
//

import SwiftUI

struct PromoCard: View {
    var promoImageUrl: String
    var promoOrder: Int
    var promoLink: String
    
    var body: some View {
        VStack{
            NetworkImage(promoImageUrl: promoImageUrl)
            HStack {
                Spacer()
                NavigationLink(destination: PromoDetailView(promoLink: promoLink)) {
                    Text("Promo \(promoOrder)")
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .background(.black)
        }
    }
    
}
