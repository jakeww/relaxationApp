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

    // The stored time of the audio player when the pause button is pressed
    @State private var storedTime: TimeInterval = 0

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
            // If the audio player is not yet initialized, create a new audio player with the file URL
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            }

            // Set the current time of the audio player to the stored time
            audioPlayer?.currentTime = storedTime

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

        // Store the current time of the audio player
        storedTime = audioPlayer?.currentTime ?? 0
    }

    // Stops the audio player
    func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlaying = false
        storedTime = 0
    }
}




struct guidedMeditationView_Previews: PreviewProvider {
    static var previews: some View {
        guidedMeditationView()
    }
}
