//
//  Array+User.swift
//  SwipeableCardsApp
//
//  Created by Ian Leon on 5/30/23.
//

import SwiftUI

extension Array where Element == User {
    var maxId: Int {
        map {$0.id}.max() ?? 0
    }
    
    func cardOffset(userId: Int) -> CGFloat {
        CGFloat(count - 1 - userId) * 8
    }
    
    func cardWidth(in geometry: GeometryProxy, userId: Int) -> CGFloat
    {
        geometry.size.width - cardOffset(userId: userId)
    }
}
