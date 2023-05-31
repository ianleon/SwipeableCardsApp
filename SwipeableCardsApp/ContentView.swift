//
//  ContentView.swift
//  SwipeableCardsApp
//
//  Created by Ian Leon on 5/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var users: [User] = [
        User(
            id: 0,
            firstName: "Mark",
            lastName: "Bennet",
            start: .red,
            end: .green
        ),
        User(
            id: 1,
            firstName: "John",
            lastName: "Lewis",
            start: .green,
            end: .orange
        ),
        User(
            id: 2,
            firstName: "Joan",
            lastName: "Mince",
            start: .blue,
            end: .green
        ),
        User(
            id: 3,
            firstName: "Liz",
            lastName: "Garret",
            start: .orange,
            end: .purple
        )
    ]
    
    func removeUser(removedUserId: Int) {
        users.removeAll { currentUser in
            currentUser.id == removedUserId
        }
    }
    
    var body: some View {
        GeometryReader {
            geometry in
            ZStack {
                ForEach(self.users) {
                    user in
                    if user.id > users.maxId - 4 {
                        CardView(user: user, onRemove: {
                            removedUser in
                            
                            users.removeAll {
                                u in
                                u.id == removedUser.id
                            }
                        })
                        .animation(.spring(), value: 1)
                        .frame(
                            width: users.cardWidth(
                                in: geometry,
                                userId: user.id
                            ),
                            height: 400
                        )
                        .offset(x: 0, y: users.cardOffset(userId: user.id))
                    }
                }
            }
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
