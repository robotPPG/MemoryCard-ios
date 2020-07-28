//
//  Array+Only.swift
//  MemoryCard
//
//  Created by 杜兆威 on 2020/7/24.
//  Copyright © 2020 杜兆威. All rights reserved.
//

import Foundation

extension Array{ //针对所有Array的extension
    var only: Element?{
        count == 1 ? first : nil //省略了return
    }
}
