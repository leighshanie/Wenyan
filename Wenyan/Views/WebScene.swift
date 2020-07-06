//
//  WebScene.swift
//  Wenyan
//
//  Created by Shane Leigh on 07/06/2020.
//  Copyright © 2020 Wenyan. All rights reserved.
//

import SwiftUI
import WebKit

struct WebScene: UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: URL(string: "index.html")!)
        uiView.load(req)
    }
}

