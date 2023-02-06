//
//  VoucherListView.swift
//  test_getplusindonesia
//
//  Created by Gale on 05/02/23.
//

import SwiftUI
import Foundation

struct VoucherListView: View {
    
    @StateObject var controller = VoucherController()
    @State private var showToast = false
        
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                ForEach( controller.voucherListData?.data.list ?? []) {voucher in
                    VStack {
                        NetworkImage(promoImageUrl: voucher.images.feature.imageURL, imageHeight: 200, imageRadius: 10)
                        HStack {
                            Text("Valid Until \(voucher.validUntil.toDateFormat())")
                            Spacer()
                            Button(action: {
                                showToast = true;
                            }) {
                                Text("USE")
                                    .frame(minWidth: 0, maxWidth: 70)
                                    .font(.system(size: 18))
                                    .padding()
                                    .foregroundColor(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .background(Color.blue) // If you have this
                            .cornerRadius(25)
                        }
                        .padding()
                    }
                    .padding()
                    .background(Color.white)
                    .alert("Feature Under Development", isPresented: $showToast) {
                        Button("OK", role: .cancel) { }
                    }
                }
                
                Spacer()
            }
            
            .navigationTitle("GetPlus Indonesia")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
