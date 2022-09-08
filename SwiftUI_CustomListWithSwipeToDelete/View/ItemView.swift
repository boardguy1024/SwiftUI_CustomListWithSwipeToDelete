//
//  ItemView.swift
//  SwiftUI_CustomListWithSwipeToDelete
//
//  Created by park kyung seok on 2022/09/08.
//

import SwiftUI

struct ItemView: View {
    
    @Binding var item: Item
    
    var body: some View {
        
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
    }
}
