//
//  EmojiMemoryGameView.swift
//  MemoryCard
//
//  Created by 杜兆威 on 2020/7/8.
//  Copyright © 2020 杜兆威. All rights reserved.
//

//MARK: View
import SwiftUI

struct EmojiMemoryGameView: View {
    //监测到ViewModel给出变化信息则更新View
    @ObservedObject var viewModel: EmojiMemoryGame
    //View
    var body: some View {
        Grid(viewModel.cards){card in
                CardView(card: card).onTapGesture {
                    self.viewModel.chose(card: card)
            }
        .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}
//CardView
struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View{
        GeometryReader{geometry in
            self.body(for: geometry.size)
        }
    }
    private func body(for size: CGSize) -> some View {
        ZStack{
            if(card.isFaceUp){
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Circle().padding(5).opacity(0.4)
                Text(card.content)
            }else{
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: 10).fill()
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    //MARK: 界面显示参数控制
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private func fontSize(for size: CGSize) -> CGFloat{
        min(size.width, size.height) * 0.7
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.chose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
