//
//  ContentView.swift
//  test_getplusindonesia
//
//  Created by Gale on 02/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PromoController()
    @State var isLinkActive = false
    @State var isLinkVoucherActive = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    NavigationLink(destination: MerchantListView(), isActive: $isLinkActive) {
                        ButtonImage(image: "image_merchant", onTap: { self.isLinkActive = true })
                    }
                    NavigationLink(destination: VoucherListView(), isActive: $isLinkVoucherActive) {
                        ButtonImage(image: "image_vouchers", onTap: { self.isLinkVoucherActive = true })
                    }
                    Spacer()
                }
                .padding()
                .border(.green)
                ScrollView {
                    HStack(spacing: 10) {
                        ForEach( viewModel.promoListData?.data.layout.promo.data ?? []) {promo in
                            PromoCard(promoImageUrl: promo.imageURL, promoOrder: promo.order, promoLink: promo.url)
                        }
                    }
                }
                Spacer()
                
            }
            .padding()
            .navigationTitle("GetPlus Indonesia")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
