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
            Text(instruction)
                .font(.title)
                .foregroundColor(.white)
                   VStack {
                       ZStack {
                           Circle()
                               .frame(width: radius * 10, height: radius * 10)
                               .foregroundColor(.blue)
                       }
                   }
               }
               .onAppear {
                   Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
                       withAnimation(Animation.easeOut(duration: 4)) {
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
            instruction = "Inhale"
            breathIn = false
        case false:
            radius = 50
            instruction = "Exhale"
            breathIn = true
        }
    }
}

struct breathingView_Previews: PreviewProvider {
    static var previews: some View {
        breathingView()
    }
}
