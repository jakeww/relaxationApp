//
//  relaxationTechniques.swift
//  relaxation
//
//  Created by Jake Watembach on 12/16/22.
//

import SwiftUI

let animationState = AnimationState()

struct RelaxationTechniquesView: View {
    let techniques = ["Home","Breathing exercises", "Progressive muscle relaxation", "Guided meditation", "Yoga"]

    @State private var selectedTechnique: Int = 0
    @State private var showBreathingTechnique: Bool = false

    var body: some View {
        TabView(selection: $selectedTechnique) {
        
            homeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

          
            BreathingView(animationState: AnimationState())
                        .tabItem {
                            Image(systemName: "wind")
                            Text("Breathing")
                        }
                        .tag(1)

      /* maybe in the future but not now
             Text("Progressive muscle relaxation")
                .tabItem {
                    Image(systemName: "dumbbell.fill")
                    Text("PMR")
                 }
                .tag(2)
*/
                   
             guidedMeditationView()
                 .tabItem {
                  Image(systemName: "headphones")
                  Text("Meditation")
                }
                .tag(3)

                
              yogaView()
                 .tabItem {
                  Image(systemName: "peacesign")
                  Text("Yoga")
                }
                .tag(4)
            
                  }.environmentObject(animationState)
              }
          }




struct RelaxationTechniquesView_Previews: PreviewProvider {
    static var previews: some View {
        RelaxationTechniquesView()
    }
}







