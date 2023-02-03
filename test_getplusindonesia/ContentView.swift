//
//  ContentView.swift
//  test_getplusindonesia
//
//  Created by Gale on 02/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PromoModel()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    ButtonImage(image: "image_merchant", onTap: { print("hello") })
                    ButtonImage(image: "image_vouchers", onTap: { print("hello") })
                    Spacer()
                }
                .padding()
                .border(.green)
                HStack(spacing: 10) {
                    ForEach( viewModel.promoListData?.data.layout.promo.data ?? []) {promo in
                        AsyncImage(
                            url: URL(string: promo.imageURL),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 300, maxHeight: 100)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
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
