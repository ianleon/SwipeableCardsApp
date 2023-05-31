//
//  CardView.swift
//  SwipeableCardsApp
//
//  Created by Ian Leon on 5/30/23.
//

import SwiftUI

struct CardView: View {
    @State
    private var translation: CGSize = .zero
    private var user: User
    private var onRemove: (_ user: User) -> Void
    
    private var threshold: CGFloat = 0.5
    
    init(user: User, onRemove: @escaping (_ user: User) -> Void) {
        self.user = user
        self.onRemove = onRemove
    }
    
    var body: some View {
        GeometryReader {
            geometry in
            
            VStack(alignment: .leading, spacing: 20) {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [user.start, user.end]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(10)
                    .frame(
                        width: geometry.size.width - 40,
                        height: geometry.size.height * 0.65
                    )
                Text("\(user.firstName) \(user.lastName)")
                    .font(.title)
                    .bold()
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 5)
//            .animation(.spring(), value: 1)
            .offset(x: translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 20), anchor: .bottom)
            .gesture(
                DragGesture()
                .onChanged {
                    translation = $0.translation
                }
                .onEnded {
                    if $0.percentage(in: geometry) > threshold {
                        onRemove(self.user)
                    } else {
                        translation = .zero
                    }
                }
            )
        }
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
