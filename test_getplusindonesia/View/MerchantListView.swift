//
//  MerchantListView.swift
//  test_getplusindonesia
//
//  Created by Gale on 04/02/23.
//

import SwiftUI

struct MerchantListView: View {
    
    @StateObject var viewModel = MerchantController()
    
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                ForEach( viewModel.merchantListData?.data.list ?? []) {merchant in
                    HStack {
                        NetworkImage(promoImageUrl: merchant.images.feature.imageURL, imageWidth: 100, imageHeight: 100)
                        Text(merchant.name)
                        Spacer()
                    }
                    .padding(.horizontal, 80)
                }
                Spacer()
            }
        }
        .padding(.vertical, 20)
        .navigationTitle("Merchant")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
}

struct MerchantListView_Previews: PreviewProvider {
    static var previews: some View {
        MerchantListView()
    }
}
