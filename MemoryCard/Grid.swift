//
//  Grid.swift
//  MemoryCard
//
//  Created by 杜兆威 on 2020/7/23.
//  Copyright © 2020 杜兆威. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item :  Identifiable, ItemView: View{
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        //1.获取了grid分配的空间
        GeometryReader{geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    
    //2.使用GridLayout将空间划分
    private func body(for layout: GridLayout) -> some View{
        ForEach(items){ item in
            self.body(for: item, in: layout)
        }
    }

    private func body(for item: Item, in layout: GridLayout) -> some View{
        let index = items.firstIndex(matching: item)! //optional的感叹号移到这里
        //因为永远不可能是nil，所以可以直接return
        return viewForItem(item)
            //3.把空间分给subview
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            //4.并把它们放置到对应的位置
            .position(layout.location(ofItemAt: index))

    }
}

