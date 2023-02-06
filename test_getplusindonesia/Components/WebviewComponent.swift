//
//  WebviewComponent.swift
//  test_getplusindonesia
//
//  Created by Gale on 04/02/23.
//

import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
    var promoLink: String
        
    typealias UIViewType = WKWebView
    
    let webView: WKWebView
    
    init(promoLink: String) {
        self.promoLink = promoLink
        webView = WKWebView(frame: .zero)
        webView.load(URLRequest(url: URL(string: self.promoLink)!))
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
