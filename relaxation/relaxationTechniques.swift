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
    @State private var showInstructions: Bool = false

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
                Text("Play")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            if showInstructions {
                VStack(alignment: .leading) {
                    Text("Instructions:")
                        .font(.headline)
                    Text("Close your eyes and take a deep breath in through your nose, filling your lungs completely. Hold your breath for a few seconds, then slowly exhale through your mouth. As you exhale, try to let go of any tension or stress you may be feeling. Repeat this process for a few minutes, focusing on your breath and letting go of any distractions. When you're ready to finish, slowly open your eyes.")
                        .font(.body)
                        .padding()
                }
            }
        }
    }

    func startBreathingExercise() {
        showInstructions = true
    }
}


struct RelaxationTechniquesView_Previews: PreviewProvider {
    static var previews: some View {
        RelaxationTechniquesView()
    }
}
