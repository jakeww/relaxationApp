//
//  breathingView.swift
//  relaxation
//
//  Created by Jake Watembach on 12/22/22.
//

import SwiftUI

struct breathingView: View {

    @State private var radius: CGFloat = 50
    @State private var breathIn: Bool = true
    @State private var instruction: String = "Get ready"

    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Circle()
                        .frame(width: radius * 7, height: radius * 7)
                        .foregroundColor(.blue)
                }
            }
            Text(instruction)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .animation(.easeOut(duration: 0.7))
        }

               .onAppear {
                   Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                       withAnimation(Animation.easeInOut(duration: 3)) {
                           self.startBreathing()
                       }
                   }
               }
               .onDisappear {
                   self.instruction = ""
               }
           }

    func startBreathing() {
        switch breathIn {
        case true:
            radius = 75
            instruction = "Breathe in"
            breathIn = false
        case false:
            radius = 50
            instruction = "Breathe out"
            breathIn = true
        }
    }
}

struct breathingView_Previews: PreviewProvider {
    static var previews: some View {
        breathingView()
    }
}
