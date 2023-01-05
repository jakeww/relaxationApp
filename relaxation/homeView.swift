//
//  homeView.swift
//  relaxation
//
//  Created by Jake Watembach on 12/22/22.
//

import SwiftUI
//color scheme
let champagnePink = Color(red: 237/255, green: 211/255, blue: 196/255)
let pinkLavender = Color(red: 200/255, green: 173/255, blue: 192/255)
let mediumSlatePurple = Color(red: 119/255, green: 101/255, blue: 227/255)
let royalBlueLight = Color(red: 59/255, green: 96/255, blue: 228/255)
let richBlack = Color(red: 8/255, green: 7/255, blue: 8/255)


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
    
    
    // Create an array of affirmations
    let affirmations = [    "I am worthy and deserving of love and respect.",    "I am capable and strong.",    "I am confident and capable.",    "I am worthy of success and abundance.",    "I am in control of my own happiness."  ]
    
    // Use a state variable to keep track of the current index of the array
    @State private var currentAffirmationIndex = 0
    

    
    // Create an array of journal prompts
    let journalPrompts = [
      "What are you grateful for today?",
      "What did you learn today?",
      "What is on your mind?",
      "What are your goals for tomorrow?",
      "How did you take care of yourself today?",
      "What positive things happened today?",
      "What is one thing you could have done differently today?",
      "What are you looking forward to tomorrow?"
    ]

    
    // Use a state variable to keep track of the current index of the array
    @State private var currentIndex = 0
    
    var body: some View {
        VStack{

            VStack {
                // Display the "Daily Journal Prompt" label
                Text("Daily Journal Prompt:")
                    .font(.headline)
                    .foregroundColor(champagnePink)
                // Display the current journal prompt
                Text(journalPrompts[currentIndex])
                  .font(.title)
                  .foregroundColor(pinkLavender)
                  .minimumScaleFactor(0.5)
                  .multilineTextAlignment(.center)
                  .cornerRadius(8)
                 

 
                Button(action: {
                    // Increment the current index, wrapping around if necessary
                    self.currentIndex = (self.currentIndex + 1) % self.journalPrompts.count
                }) {
                    Text("Next Prompt")
                      .foregroundColor(mediumSlatePurple)
                      .padding(.all, 10.0)
                }
                .background(RoundedRectangle(cornerRadius: 10).fill(champagnePink))



            }
            .background(royalBlueLight) // apply background color to VStack


            
            
            
            VStack {
                Text("Mood Tracker")
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
                                        Text(" ")
                                            .padding()
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
                    .padding(.horizontal)
                    .frame(height: 200)
                    .border(Color.gray, width: 1)

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
