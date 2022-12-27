//
//  yogaView.swift
//  relaxation
//
//  Created by Jake Watembach on 12/22/22.
//

import SwiftUI

struct yogaView: View {
    // State variables to track which button is selected and which slide is currently displayed
    @State private var selectedButton = -1
    @State private var currentSlide = 0
    
    let yogaPoses = [
        ["Mountain Pose", "Downward-Facing Dog", "Low Lunge", "Warrior II", "Camel Pose"],
        ["Child's Pose", "Upward-Facing Dog", "Warrior I", "Extended Triangle", "Tree Pose"],
        ["Cobra Pose", "Low Plank", "Upward-Facing Dog", "Side Plank", "Bridge Pose"],
        ["Seated Forward Bend", "Puppy Pose", "Lizard Pose", "Corpse Pose", "Meditation"]
    ]
    
    var body: some View {
        ZStack {
            // Background color for the view
            Color.white
            // Button icons that allow the user to select a slideshow
            VStack {
                HStack {
                    Button(action: { self.selectedButton = 0; self.currentSlide = 0 }) {
                        Image(systemName: "1.square.fill")
                            .font(.largeTitle)
                            .foregroundColor(self.selectedButton == 0 ? .green : .gray)
                    }
                    .padding(20)
                    Button(action: { self.selectedButton = 1; self.currentSlide = 0 }) {
                        Image(systemName: "2.square.fill")
                            .font(.largeTitle)
                            .foregroundColor(self.selectedButton == 1 ? .green : .gray)
                    }
                    .padding(20)
                }
                HStack {
                    Button(action: { self.selectedButton = 2; self.currentSlide = 0 }) {
                        Image(systemName: "3.square.fill")
                            .font(.largeTitle)
                            .foregroundColor(self.selectedButton == 2 ? .green : .gray)
                    }
                    .padding(20)
                    Button(action: { self.selectedButton = 3; self.currentSlide = 0 }) {
                        Image(systemName: "4.square.fill")
                            .font(.largeTitle)
                            .foregroundColor(self.selectedButton == 3 ? .green : .gray)
                    }
                    .padding(20)
                }
            }
            
            // Slideshow with yoga pose descriptions
            if self.selectedButton >= 0 {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .padding(.horizontal)
                        .foregroundColor(.blue)
                    VStack {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.largeTitle)
                        Text(yogaPoses[selectedButton][currentSlide])
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        HStack {
                            Button(action: {
                                if self.currentSlide > 0 {
                                    self.currentSlide -= 1
                                }
                            }) {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Button(action: {
                                if self.currentSlide < 4 {
                                    self.currentSlide += 1
                                }
                            }) {
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.black)
                            }
                        }
                        Button(action: { self.selectedButton = -1 }) {
                            Text("Close")
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }

            }
        }
    }
}



struct yogaView_Previews: PreviewProvider {
    static var previews: some View {
        yogaView()
    }
}
