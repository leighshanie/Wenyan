//
//  ViewController.swift
//  Wenyan
//
//  Created by Shane Leigh on 10/06/2020.
//  Copyright © 2020 Wenyan. All rights reserved.
//

import Foundation
import UIKit
import DTCoreText

class ViewController: UIViewController {
    
    var textView: DTAttributedTextView = DTAttributedTextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSubviews()
        
    }
    
    func initSubviews() {
        self.view.backgroundColor = UIColor.white
        
        let htmlPath = Bundle.main.path(forResource: "test", ofType: "html")
        let htmlString = try? String(contentsOfFile: htmlPath ?? "", encoding: .utf8)
        
        textView.frame = view.bounds
        textView.contentInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
        textView.textDelegate = self
        textView.attributedString = getAttributedStringWith(html: htmlString!)
        self.view.addSubview(textView)
    }
    
    func getAttributedStringWith(html: String) -> NSAttributedString {
        let htmlData = html.data(using: .utf8)
        let options = [
            NSTextSizeMultiplierDocumentOption : NSNumber(value: 1.0),
            DTDefaultFontFamily : "Times New Roman",
            DTDefaultLinkColor : "purple",
            DTDefaultLinkHighlightColor : "red",
            DTDefaultFontSize: "18",
            DTDefaultTextAlignment: "left",
            DTDefaultLineHeightMultiplier: "1.6"
            ] as [String : Any]
        let attributedString = NSAttributedString(htmlData: htmlData, options: options , documentAttributes: nil)
        return attributedString!
    }

}

extension ViewController: DTAttributedTextContentViewDelegate {
    func attributedTextContentView(_ attributedTextContentView: DTAttributedTextContentView!, viewFor attachment: DTTextAttachment!, frame: CGRect) -> UIView! {
        if (attachment is DTImageTextAttachment) {
            let imageView = DTLazyImageView(frame: frame)
            imageView.delegate = self
            imageView.image = (attachment as! DTImageTextAttachment).image
            imageView.url = attachment.contentURL
            if let attachmentUrl = attachment!.hyperLinkURL {
                imageView.isUserInteractionEnabled = true
                let button = DTLinkButton(frame: imageView.bounds)
                button.url = attachmentUrl
                button.minimumHitSize = CGSize(width: 25, height: 25)
                button.guid = attachment.hyperLinkGUID
                imageView.addSubview(button)
            }

            return imageView
        }
        return nil
    }
}

extension ViewController: DTLazyImageViewDelegate {
    func lazyImageView(_ lazyImageView: DTLazyImageView!, didChangeImageSize size: CGSize) {
        let url: URL? = lazyImageView.url
        let imageSize: CGSize = size
        var pred: NSPredicate? = nil
        if let url = url {
            pred = NSPredicate(format: "contentURL == %@", url as CVarArg)
            
        }
        var didUpdate = false

        for oneAttachment in textView.attributedTextContentView.layoutFrame.textAttachments(with: pred) {
            if (oneAttachment as! DTTextAttachment).originalSize.equalTo(CGSize.zero) {
                let sizeWidth: CGFloat = UIScreen.main.bounds.size.width
                (oneAttachment as! DTTextAttachment).originalSize = CGSize(width: sizeWidth - 30, height: (sizeWidth - 30) * imageSize.height / imageSize.width)
                didUpdate = true
            }
        }

        if didUpdate {
            DispatchQueue.main.async(execute: {
                self.textView.relayoutText()
            })
        }

    }
}
