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
    
    let imageNames = ["warriorOne", "warriorTwo", "warriorThree", "standingBow"]
    @State var currentIndex = 0


    var body: some View {
        ZStack {
            // Background color for the view
            Color("PurpleNavy")
            // Slideshow with yoga pose images
            Image(imageNames[currentIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)

            HStack {
                Button(action: {
                    self.currentIndex -= 1
                    if self.currentIndex < 0 {
                        self.currentIndex = imageNames.count - 1
                    }
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color("Cream"))
                        .padding(.leading)
                        .font(.system(size: 30))
                }


                Spacer()
                Button(action: {
                    self.currentIndex = (self.currentIndex + 1) % imageNames.count

                }) {
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color("Cream"))
                        .padding(.trailing)
                        .font(.system(size: 30))
                }

            }
        }.ignoresSafeArea(.all)
    }

        }




struct yogaView_Previews: PreviewProvider {
    static var previews: some View {
        yogaView()
    }
}
