//
//  ContentView.swift
//  Wenyan
//
//  Created by Shane Leigh on 07/06/2020.
//  Copyright © 2020 Wenyan. All rights reserved.
//

import SwiftUI
import UIKit
import DTCoreText
import TextView

struct ContentView: View {

    @State private var content = "先帝創業未半而中道崩殂，今天下三分，益州疲弊，此誠危急存亡之秋也。然侍衛之臣不懈于內，忠志之士忘身于外者，蓋追先帝之殊遇，欲報之于陛下也。誠宜開張聖聽，以光先帝遺德，恢弘志士之氣，不宜妄自菲薄，引喻失義，以塞忠谏之路也。宮中府中，俱爲壹體，陟罰臧否，不宜異同。若有作奸犯科及爲忠善者，宜付有司論其刑賞，以昭陛下平明之理，不宜偏私，使內外異法也。侍中、侍郎郭攸之、費祎、董允等，此皆良實，志慮忠純，是以先帝簡拔以遺陛下。愚以爲宮中之事，事無大小，悉以咨之，然後施行，必能脾補阙漏，有所廣益。將軍向寵，性行淑均，曉暢軍事，試用于昔日，先帝稱之曰能，是以衆議舉寵爲督。愚以爲營中之事，悉以咨之，必能使行陣和睦，優劣得所。親賢臣，遠小人，此先漢所以興隆也；親小人，遠賢臣，此後漢所以傾頹也。先帝在時，每與臣論此事，未嘗不歎息痛恨于桓、靈也。侍中、尚書、長史、參軍，此悉貞良死節之臣，願陛下親之信之，則漢室之隆，可計日而待也。臣本布衣，躬耕于南陽，苟全性命于亂世，不求聞達于諸侯。先帝不以臣卑鄙，猥自枉屈，三顧臣于草廬之中，咨臣以當世之事，由是感激，遂許先帝以驅馳。後值傾覆，受任于敗軍之際，奉命于危難之間，爾來二十有壹年矣。先帝知臣謹慎，故臨崩寄臣以大事也。受命以來，夙夜憂歎，恐托付不效，以傷先帝之明，故五月渡泸，深入不毛。今南方已定，兵甲已足，當獎率三軍，北定中原，庶竭驽鈍，攘除奸凶，興複漢室，還于舊都。此臣所以報先帝而忠陛下之職分也。至于斟酌損益，進盡忠言，則攸之、祎、允之任也。願陛下托臣以討賊興複之效，不效，則治臣之罪，以告先帝之靈。若無興德之言，則責攸之、祎、允等之慢，以彰其咎；陛下亦宜自謀，以咨诹善道，察納雅言，深追先帝遺诏，臣不勝受恩感激。今當遠離，臨表涕零，不知所言。"
    
    @State private var isEditing = false
    var body: some View {
        
        VStack {
            Spacer()
            Text("出師表").font(.custom("NOtoSerifTC-Bold", size: 25))
                .padding()

            Text("諸葛亮")
                .font(.system(size: 15, weight: .light, design: .serif))
                .italic()
                .frame(maxWidth: 250, alignment: .trailing)
            
            TextView(
                text: $content,
                isEditing: $isEditing,
                font: UIFont.init(name: "NOtoSerifTC-Regular", size: 20)!,
                isEditable: false
            
            )
                .padding()
            
            
        }
//        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//        .edgesIgnoringSafeArea(.all)
//        .navigationBarTitle("Content")

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

