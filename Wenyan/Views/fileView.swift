//
//  fileView.swift
//  Wenyan
//
//  Created by Shane Leigh on 07/06/2020.
//  Copyright © 2020 Wenyan. All rights reserved.
//

import SwiftUI
import WebKit

struct fileView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {

        let path = Bundle.main.path(forResource: "Essentials_Sonic_Pi-v1", ofType: "pdf")
        let req = URLRequest(url: URL(fileURLWithPath: path!))
        uiView.load(req)
    }
}
