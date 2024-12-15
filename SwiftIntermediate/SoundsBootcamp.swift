//
//  SoundsBootcamp.swift
//  SwiftIntermediate
//
//  Created by Toni Stoyanov on 15.12.24.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {
    
    var body: some View {
        VStack(spacing: 40) {
            Button(action: {
                SoundManager.instance.playSound(sound: .badum)
            }, label: {
                Text("Play sound")
            })
            
            Button(action: {
                SoundManager.instance.playSound(sound: .tada)
            }, label: {
                Text("Play sound 2")
            })
        }
    }
}

#Preview {
    SoundsBootcamp()
}
