//
//  LoadingView.swift
//  Swift Colors
//
//  Created by Zack Wilson on 5/2/21.
//

import SwiftUI

struct LoadingView: View {
    @State private var moveRightLeft = false
    
    let screenFrame = Color(.systemBackground)
    var body: some View {
        VStack {
            ZStack {
                Capsule()
                    .frame(width: 128, height: 6, alignment: .center)
                    .foregroundColor(Color(.systemGray4))
                Capsule()
                    .clipShape(Rectangle()
                                .offset(x: moveRightLeft ? 80 : -80))
                    .frame(width: 100, height: 6, alignment: .leading)
                    .foregroundColor(Color(.systemBlue))
                    .offset(x: moveRightLeft ? 14 : -14)
                    .animation(Animation.easeInOut(duration: 0.5)
                                .delay(0.2)
                                .repeatForever(autoreverses: true))
                    .onAppear() {
                        moveRightLeft.toggle()
                    }
            }
            Text("Loading...")
        }
    }
}
