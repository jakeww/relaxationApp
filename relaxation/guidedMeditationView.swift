//
//  guidedMeditationView.swift
//  relaxation
//
//  Created by Jake Watembach on 12/23/22.
//

import SwiftUI
import AVFoundation

struct guidedMeditationView: View {
    // The audio player
    @State private var audioPlayer: AVAudioPlayer?

    // The state of the audio player
    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            // The play button
            Button(action: { self.play() }) {
                Text("Play")
            }

            // The pause button
            Button(action: { self.pause() }) {
                Text("Pause")
            }

            // The stop button
            Button(action: { self.stop() }) {
                Text("Stop")
            }
        }
    }

    // Plays the guided meditation audio file
    func play() {
        // Locate the "Guided Meditation Compassion.m4a" file in the app's bundle
        guard let fileURL = Bundle.main.url(forResource: "Guided Meditation Compassion", withExtension: "m4a") else {
            print("Error finding audio file")
            return
        }

        do {
            // Create an audio player with the file URL
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)

            // Play the audio
            audioPlayer?.play()
            isPlaying = true
        } catch {
            print("Error playing audio: \(error)")
        }
    }

    // Pauses the audio player
    func pause() {
        audioPlayer?.pause()
        isPlaying = false
    }

    // Stops the audio player
    func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlaying = false
    }
}



struct guidedMeditationView_Previews: PreviewProvider {
    static var previews: some View {
        guidedMeditationView()
    }
}
