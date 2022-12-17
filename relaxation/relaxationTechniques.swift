//
//  relaxationTechniques.swift
//  relaxation
//
//  Created by Jake Watembach on 12/16/22.
//

import SwiftUI

struct RelaxationTechniquesView: View {
    let techniques = ["Breathing exercises", "Progressive muscle relaxation", "Guided meditation", "Nature sounds", "Yoga"]

    @State private var selectedTechnique: Int = 0
    @State private var showBreathingTechnique: Bool = false
    
    var body: some View {
        
        VStack {
            Text("Choose a relaxation technique:")
                .font(.title)
           
            Picker("Techniques", selection: $selectedTechnique) {
                ForEach(0..<techniques.count) {
                    Text(self.techniques[$0])
                }
            }
                
            .pickerStyle(SegmentedPickerStyle())

            Button(action: {
                if self.selectedTechnique == 0 {
                    self.startBreathingExercise()
                } else if self.selectedTechnique == 1 {
                    // start progressive muscle relaxation
                } else if self.selectedTechnique == 2 {
                    // start guided meditation
                } else if self.selectedTechnique == 3 {
                    // start nature sounds
                } else if self.selectedTechnique == 4 {
                    // start yoga
                }
            }) {
                Text("Select")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            if showBreathingTechnique {
                BreathingView(start: showBreathingTechnique)
            }
        }
    }

    func startBreathingExercise() {
        showBreathingTechnique = true
    }
}



struct RelaxationTechniquesView_Previews: PreviewProvider {
    static var previews: some View {
        RelaxationTechniquesView()
    }
}

struct BreathingView: View {
    @State private var radius: CGFloat = 50
    @State private var breathIn: Bool = true
    @State private var breathHold: Bool = false
    @State private var breathOut: Bool = false
    @State private var instruction: String = "Breathe In"
    let start: Bool

    var body: some View {
        VStack {
            Text(instruction)
                .font(.headline)
                .padding(.leading)

            Circle()
                .frame(width: radius * 2, height: radius * 2)
                .foregroundColor(.blue)
                
        }
        .onAppear {
            self.startBreathing()
        }
    }

    init(start: Bool) {
        self.start = start
        if start {
            startBreathing()
        }
    }

    func startBreathing() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            withAnimation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true)) {
                if self.breathIn {
                    self.radius = 75
                    self.instruction = "Breath In"
                    self.breathIn = false
                    self.breathHold = true
                } else if self.breathHold {
                    self.radius = 75
                    self.instruction = "Hold"
                    self.breathHold = false
                    self.breathOut = true
                } else if self.breathOut {
                    self.radius = 50
                    self.instruction = "Breathe Out"
                    self.breathOut = false
                    self.breathIn = true
                }
            }
        }
    }//start breathing
}

