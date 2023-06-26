//
//  AudioPlayer.swift
//  Restart
//
//  Created by Sands on 2023/6/26.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(_ sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            audioPlayer?.play()
        } catch {
            print("Can not play the sound: \(error)")
        }
    }
}

