//
//  Array+Identifiable.swift
//  MemoryCard
//
//  Created by 杜兆威 on 2020/7/24.
//  Copyright © 2020 杜兆威. All rights reserved.
//

import Foundation
//对一些名字进行修改，增强可读性
//用constrains是的下面这个func对所有的identifiable的array生效
extension Array where Element: Identifiable{
    //现在索引不是Item而是Element
    func firstIndex(matching: Element) -> Int?{
        for index in 0..<self.count{ //items改成self
            if self[index].id == matching.id{
                return index
            }
        }
        return nil  //改成option就可以返回nil了
    }
}
