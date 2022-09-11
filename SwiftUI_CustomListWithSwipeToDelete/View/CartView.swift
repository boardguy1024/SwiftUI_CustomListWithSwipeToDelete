//
//  CartView.swift
//  SwiftUI_CustomListWithSwipeToDelete
//
//  Created by park kyung seok on 2022/09/08.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var cartData = CartViewModel()
    
    var body: some View {
        
        VStack {
            
            // Custom NaviBar
            HStack(spacing: 20) {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(.black)
                }
                Text("My Cart")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(spacing: 0) {
                    
                    ForEach(cartData.items) { item in
                        ItemView(item: cartData.items[getIndex(item: item)], items: $cartData.items)
                    }
                }
            }
        }
        .background(Color("gray").ignoresSafeArea())
    }
    
    func getIndex(item: Item) -> Int {
        
        return cartData.items.firstIndex { item1 in
            return item.id == item1.id
        } ?? 0
    }
}

