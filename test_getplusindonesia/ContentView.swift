//
//  ContentView.swift
//  test_getplusindonesia
//
//  Created by Gale on 02/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image("image_merchant")
                        .resizable()
                        .frame(width: 40.0, height: 40.0)
                    Image("image_vouchers")
                        .resizable()
                        .frame(width: 40.0, height: 40.0)
                    ButtonImage()
                    Spacer()
                }
                .padding()
                .border(.green)
                
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
