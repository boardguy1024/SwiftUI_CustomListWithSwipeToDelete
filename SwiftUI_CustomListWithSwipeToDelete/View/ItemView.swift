//
//  ItemView.swift
//  SwiftUI_CustomListWithSwipeToDelete
//
//  Created by park kyung seok on 2022/09/08.
//

import SwiftUI

struct ItemView: View {
    
    @State var item: Item
    @Binding var items: [Item]
    var body: some View {
        
        
        ZStack {
            
            LinearGradient(gradient: .init(colors: [Color("lightblue"), Color("blue")]), startPoint: .leading, endPoint: .trailing)
            
            // Delete Button
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation(.easeOut) {
                        deleteItem()
                    }
                }) {
                    Image(systemName: "trash")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 90, height: 50)
                }
            }
            
            HStack(spacing: 15) {
                
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .cornerRadius(15)
                
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(item.name)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text(item.details)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 15) {
                        
                        Text("\(item.price)")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.black)
                        }
                        
                        Text("\(item.quantity)")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(Color.black.opacity(0.05))
                        
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .padding()
            .background(Color("gray"))
            .contentShape(Rectangle())
            .offset(x: item.offset)
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
        }
        
    }
    
    func deleteItem() {
        items.removeAll { item in
            item.id == self.item.id
        }
    }
    
    func onChanged(value: DragGesture.Value) {
        
        if value.translation.width < 0 {
            
            if item.isSwiped {
                item.offset = value.translation.width - 90
            } else {
                item.offset = value.translation.width
            }
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        
        withAnimation(.easeOut) {
            if value.translation.width < 0 {
                
                //左に半分以上Swipeした場合には完全に左に寄せる
                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    item.offset = -UIScreen.main.bounds.width
                    
                    deleteItem()
                    
                } else if -item.offset > 50 {
                    item.isSwiped = true
                    item.offset = -90 // ちょっとだけSwipeした場合、削除ボタンが見えるだけの間隔にする
                } else {
                    item.isSwiped = false
                    item.offset = 0
                }
            } else {
                //右へswipeした場合には 元に戻す
                item.isSwiped = false
                item.offset = 0
            }
        }
       
    }
}
