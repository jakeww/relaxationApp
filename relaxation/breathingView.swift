//
//  breathingView.swift
//  relaxation
//
//  Created by Jake Watembach on 12/22/22.
//

import SwiftUI

class AnimationState: ObservableObject {
    @Published var isAnimating: Bool = false
}

class BreathingTimer {
    var breathingView: BreathingView
    var timer: Timer?
    init(animationState: AnimationState) {
        self.breathingView = BreathingView(animationState: animationState)
    }
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            withAnimation(Animation.easeInOut(duration: 3)) {
                self.breathingView.startBreathing()
            }
        }
    }
    func stop() {
        timer?.invalidate()
        timer = nil
    }
}


struct BreathingView: View {
    @ObservedObject var animationState: AnimationState
    @State private var radius: CGFloat = 50
    @State private var breathIn: Bool = true
    @State private var instruction: String = "Get ready"
    @State private var isStarting: Bool = false
    @State private var timer: Timer?
    @State private var animationRunning: Bool = false
    
    func reset() {
        radius = 50
        breathIn = true
        instruction = "Get ready"
        isStarting = false
        animationRunning = false
    }
    
    
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Circle()
                        .frame(width: radius * 7, height: radius * 7)
                        .foregroundColor(Color("OxfordBlue"))
                }
            }
            Text(instruction)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .animation(.easeOut(duration: 0.7))
            if !isStarting {
                Button("Tap to begin!") {
                    self.isStarting = true
                    self.animationState.isAnimating = true
                    self.instruction = "Get ready..."
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        if self.timer == nil {
                            self.timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
                                self.startBreathing()
                            }
                        }
                    }
                }
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .background(Color("OxfordBlue"))
                .foregroundColor(Color("Cream"))
                .cornerRadius(10)
            } else {
                Circle()
                    .frame(width: radius * 7, height: radius * 7)
                    .foregroundColor(Color("OxfordBlue"))
                Text(instruction)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .animation(.easeOut(duration: 0.7))
                    .onReceive(animationState.$isAnimating) { isAnimating in
                        if isAnimating {
                            self.timer?.fire()
                        } else {
                            self.timer?.invalidate()
                        }
                    }
                    .onAppear {
                        self.animationState.isAnimating = true
                    }
                    .onDisappear {
                        self.animationState.isAnimating = false
                        self.timer?.invalidate()
                        self.timer = nil
                        self.reset()
                    }
                
            }}
        .padding(800)
        .background(Color("PurpleNavy"))
            .edgesIgnoringSafeArea(.all)
           
    }
    func startBreathing() {
        instruction = "Get ready..."
        withAnimation(Animation.easeInOut(duration: 3)) {
            if self.breathIn {
                self.instruction = "Breathe in"
                self.radius = 100
            } else {
                self.instruction = "Breathe out"
                self.radius = 50
            }
        }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.breathIn.toggle()
                    }
    }

}

struct breathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView(animationState: animationState)
    }
}
