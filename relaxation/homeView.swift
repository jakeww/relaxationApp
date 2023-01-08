//
//  homeView.swift
//  relaxation
//
//  Created by Jake Watembach on 12/22/22.
//

import SwiftUI
import Foundation



struct homeView: View {

    let moodIcons = ["😊", "😐", "😟"]
   
    @State private var currentMood = 0
    @State private var moods = [Int](repeating: 0, count: 7)
    @State private var selectedDay: Int? = nil
    
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
     var journalPrompts = [
      "What are you grateful for today?",
      "What did you learn today?",
      "What is on your mind?",
      "What are your goals for tomorrow?",
      "How did you take care of yourself today?",
      "What positive things happened today?",
      "What is one thing you could have done differently today?",
      "What are you looking forward to tomorrow?",
      "What are three things you are grateful for today?",
      "Write about a time when you felt really proud of yourself.",
      "What are some small things you can do to take care of yourself today?",
      "What is one thing you can do to bring more joy into your life?",
      "Write about a place where you feel calm and at peace.",
      "What are some things that bring you comfort when you're feeling anxious?",
      "Write about a positive experience you had recently.",
      "What are some self-care activities you can do to relax and unwind?",
      "Write about a person who has had a positive impact on your life.",
      "What are some things you can do to cultivate gratitude in your daily life?"
    ]

    
    
    @State private var currentIndex: Int = 0
    @State private var lastIndex: Int = 0

    init() {
        currentIndex = Int.random(in: 0..<self.journalPrompts.count)
    }

    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                VStack {
                    Text("Daily Journal Prompt:")
                        .font(.headline)
                        .foregroundColor(Color("CustomWhite"))
                    Text(journalPrompts[currentIndex])
                        .font(.title)
                        .foregroundColor(Color("Cream"))
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(height: 125)
                    
                    Button(action: {
                        repeat {
                            self.currentIndex = Int.random(in: 0..<self.journalPrompts.count)
                        } while (self.currentIndex == self.lastIndex)
                        self.lastIndex = self.currentIndex
                    }) {
                        Text("Next Prompt")
                            .foregroundColor(Color("CustomWhite"))
                            .padding(.all, 10.0)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("OxfordBlue")))

                }
                
                VStack {
                    Text("Mood Tracker")
                        .font(.title)
                        .foregroundColor(Color("Cream"))
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
