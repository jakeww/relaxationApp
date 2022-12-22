//
//  relaxationTechniques.swift
//  relaxation
//
//  Created by Jake Watembach on 12/16/22.
//

import SwiftUI

struct RelaxationTechniquesView: View {
    let techniques = ["Home","Breathing exercises", "Progressive muscle relaxation", "Guided meditation", "Yoga"]

    @State private var selectedTechnique: Int = 0
    @State private var showBreathingTechnique: Bool = false

    var body: some View {
        TabView(selection: $selectedTechnique) {
        
            Text("Home")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

          
            breathingView()
                .tabItem {
                    Image(systemName: "wind")
                    Text("Breathing")
                }
                .tag(1)

      
             Text("Progressive muscle relaxation")
                .tabItem {
                    Image(systemName: "dumbbell.fill")
                    Text("PMR")
                 }
                .tag(2)

                   
             Text("Guided meditation")
                 .tabItem {
                  Image(systemName: "headphones")
                  Text("Meditation")
                }
                .tag(3)

                
              Text("Yoga")
                 .tabItem {
                  Image(systemName: "peacesign")
                  Text("Yoga")
                }
                .tag(4)
            
                  }
              }
          }




struct RelaxationTechniquesView_Previews: PreviewProvider {
    static var previews: some View {
        RelaxationTechniquesView()
    }
}







