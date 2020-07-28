//
//  EmojiMemoryGame.swift
//  MemoryCard
//
//  Created by 杜兆威 on 2020/7/8.
//  Copyright © 2020 杜兆威. All rights reserved.
//

//MARK: ViewModle
import SwiftUI
class EmojiMemoryGame: ObservableObject{
    @Published private var model = createMemeoryGmae()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    //MARK: 和视频不一样的写法 需要把model static
    // var cards = model.cards
    
    func chose(card:MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    //MARK: cards模型创建
    static func createMemeoryGmae() -> MemoryGame<String>{
        let emojis=["👺","🎖","🤓","🤪","🚗","👻","💩"]
//        let emojis=["🤓","🤪","🚗"]
        return MemoryGame<String>.init(numberOfPairsOfCards: emojis.count ){pairIndex in
            return emojis[pairIndex]
        }
    }
}

