//
//  Cardify.swift
//  MemoryCard
//
//  Created by 杜兆威 on 2020/7/29.
//  Copyright © 2020 杜兆威. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool

    func body(content: Content) -> some View{
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content //卡片上的内容要放在该放的位置
            }else{
                //因为可以modfier任何view所以，iaMatched属性不放在这
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
    }

    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View{
    func cardify(isFaceUp: Bool) -> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
