//
//  guidedMeditationView.swift
//  relaxation
//
//  Created by Jake Watembach on 12/23/22.
//

import SwiftUI
import AVFoundation
import UIKit


struct guidedMeditationView: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlaying: Bool = false
    @State private var storedTime: TimeInterval = 0
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    
    var body: some View {
        VStack{
            HStack {
                Button(action: { self.play() }) {
                    Image(systemName: "play.square.fill")
                        .font(.system(size: 50.0))
                }
                
                Button(action: { self.pause() }) {
                    Image(systemName: "pause.rectangle.fill")
                        .font(.system(size: 50.0))
                }
                
                Button(action: { self.stop() }) {
                    Image(systemName: "xmark.square.fill")
                        .font(.system(size: 50.0))
                }
            }
            ProgressView("Progress:", value: progress, total: 1.0)
                .id(progress)
                .frame(width: 200, height: 20)
            
        }
    }
        
    func play() {
        guard let fileURL = Bundle.main.url(forResource: "Guided Meditation Compassion", withExtension: "m4a") else {
            print("Error finding audio file")
            return
        }
        
        do {
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            }
            audioPlayer?.currentTime = storedTime
            audioPlayer?.play()
            isPlaying = true
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.updateProgress()
            }
        } catch {
            print("Error playing audio: \(error)")
        }
    }
    
    func pause() {
        audioPlayer?.pause()
        isPlaying = false
        storedTime = audioPlayer?.currentTime ?? 0
        timer?.invalidate()
    }
    
    func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlaying = false
        storedTime = 0
        timer?.invalidate()
    }
    
    func updateProgress() {
        guard let audioPlayer = audioPlayer else { return }
        progress = audioPlayer.currentTime / audioPlayer.duration
        print("update progress")
    }
}





struct guidedMeditationView_Previews: PreviewProvider {
    static var previews: some View {
        guidedMeditationView()
    }
}
