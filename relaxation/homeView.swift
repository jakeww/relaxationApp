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
        ZStack{
            VStack{
                Spacer()
                VStack {
                    // Display the "Daily Journal Prompt" label
                    Text("Daily Journal Prompt:")
                        .font(.headline)
                        .foregroundColor(Color("HelitropeGrey"))
                    // Display the current journal prompt
                    Text(journalPrompts[currentIndex])
                        .font(.title)
                        .foregroundColor(Color("Almond"))
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .cornerRadius(8)
                    
                    
                    
                    Button(action: {
                        // Increment the current index, wrapping around if necessary
                        self.currentIndex = (self.currentIndex + 1) % self.journalPrompts.count
                    }) {
                        Text("Next Prompt")
                            .foregroundColor(Color("HelitropeGrey"))
                            .padding(.all, 10.0)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("OxfordBlue")))
                    
                    
                    
                }
                
                VStack {
                    Text("Mood Tracker")
                        .font(.title)
                        .foregroundColor(Color("HelitropeGrey"))
                    ScrollView(.horizontal, showsIndicators: false) {
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
                                .background(self.selectedDay == day ? Color("HelitropeGrey") : Color("PurpleNavy"))


                                .foregroundColor(self.selectedDay == day ? Color.black : Color.gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                            }
                        }
                        .padding([.leading, .bottom, .trailing])
                    }
                }.padding(.vertical).background(Color("OxfordBlue"))
                
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
                Spacer()
                
            }.background(Color("PurpleNavy"))
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }.background(Color("OxfordBlue"))
            .edgesIgnoringSafeArea(.all)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        
    }
}
                    
struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
