//
//  DragGesture+PercentageExtension.swift
//  SwipeableCardsApp
//
//  Created by Ian Leon on 5/30/23.
//

import SwiftUI

extension DragGesture.Value {
    func percentage(in geometry: GeometryProxy) -> CGFloat {
        abs(translation.width / geometry.size.width)
    }
}
