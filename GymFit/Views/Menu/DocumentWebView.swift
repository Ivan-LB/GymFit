//
//  DocumentWebView.swift
//  GymFit
//
//  Created by Ivan Lorenzana Belli on 03/09/24.
//

import SwiftUI
import WebKit

struct DocumentWebView: View {
        
    var body: some View {
        WebView()
    }
}

struct WebView: UIViewRepresentable {
    let webView: WKWebView
    
    init() {
        self.webView = WKWebView(frame: .zero)
    }

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let url: URL
        url = ConfigurationManager.shared.faqURL
        webView.load(URLRequest(url: url))
    }
}


#Preview {
    DocumentWebView()
}
