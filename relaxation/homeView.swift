//
//  homeView.swift
//  relaxation
//
//  Created by Jake Watembach on 12/22/22.
//

import SwiftUI

struct homeView: View {
    // Create an array of mood icons
    let moodIcons = ["😊", "😐", "😟"]
    
    // Use a state variable to keep track of the current mood
    @State private var currentMood = 0
    
    // Use a state variable to keep track of the moods for each day
    @State private var moods = [Int](repeating: 0, count: 7)
    
    // Use a state variable to keep track of the selected day
    @State private var selectedDay: Int? = nil
    
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    

    
    // Create an array of journal prompts
    let journalPrompts = ["What are you grateful for today?", "What did you learn today?", "What is on your mind?", "What are your goals for tomorrow?"]
    
    // Use a state variable to keep track of the current index of the array
    @State private var currentIndex = 0
    
    var body: some View {
        VStack{
            VStack {
                // Display the "Daily Journal Prompt" label
                Text("Daily Journal Prompt:")
                    .font(.headline)
                    .padding(.vertical, 20)
                
                // Display the current journal prompt
                Text(journalPrompts[currentIndex])
                    .font(.title)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .border(Color.gray, width: 2)
                
                // Add a button to cycle through the journal prompts
                Button(action: {
                    // Increment the current index, wrapping around if necessary
                    self.currentIndex = (self.currentIndex + 1) % self.journalPrompts.count
                }) {
                    Text("Next Prompt")
                }
                .padding(.bottom, 20)
            }//vStack
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<7, id: \.self) { day in
                            Button(action: {
                                self.selectedDay = day
                            }) {
                                VStack {
                                    if let mood = self.moods[day] {
                                        Text(self.moodIcons[mood])
                                            .font(.system(size: 50.0))
                                            .padding(.all, 20.0)
                                    } else {
                                        Text("")
                                        padding()
                                    }
                                    Text(self.days[day])
                                        .font(.title2)
                                }
                            }
                            .background(self.selectedDay == day ? Color.yellow : Color.white)
                            .foregroundColor(self.selectedDay == day ? Color.black : Color.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                        }
                    }
                    .padding(.horizontal)//h stack
                }
            }
            
            if selectedDay != nil {
                Picker(selection: $currentMood, label: Text("Mood")) {
                    ForEach(0..<moodIcons.count, id: \.self) { index in
                        Text(self.moodIcons[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Button(action: {
                    self.moods[self.selectedDay!] = self.currentMood
                    self.selectedDay = nil
                }) {
                    Text("Save Mood")
                }
                .padding()
            }
        }
    }//body view
}
                    
struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
