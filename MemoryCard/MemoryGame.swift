//
//  MemoryGame.swift
//  MemoryCard
//
//  Created by 杜兆威 on 2020/7/8.
//  Copyright © 2020 杜兆威. All rights reserved.
//

//MARK: Model
import Foundation
struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards:Array<Card>
    
    //使用computed var实现
    private var indexOfTheOneAndOnlyFaceUpCard: Int?{ //可以在这里初始化为nil但是不这么做
        get{cards.indices.filter{cards[$0].isFaceUp}.only}
        set{
            for index in cards.indices{
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    //MARK: 用户意图
    mutating func choose(card: Card){
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMtachIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMtachIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMtachIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true //choose的那张朝上
            }else{
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    //MARK: cards初始化
    init(numberOfPairsOfCards:Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    // Card 结构
    struct Card:Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
