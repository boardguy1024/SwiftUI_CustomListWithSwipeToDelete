//
//  Item.swift
//  SwiftUI_CustomListWithSwipeToDelete
//
//  Created by park kyung seok on 2022/09/08.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var name: String
    var details: String
    var image: String
    var price: Float
    var quantity: Int
    var offset: CGFloat
    var isSwiped: Bool
}
