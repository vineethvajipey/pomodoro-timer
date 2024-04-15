//
//  TestTimerView.swift
//  tomato
//
//  Created by Vineeth Vajipey on 4/13/24.
//

import SwiftUI

struct TestTimerView: View {
    @State private var timeRemaining = 25 * 1 // 25 minutes in seconds
    @State private var timerRunning = false
    @State var round: Int = 0
    @State private var showAlert = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 20) {
            Text("\(timeString(time: timeRemaining))")
                .font(.system(size: 48))
                .padding()
                .foregroundColor(timerRunning ? .green : .red)

            Button(timerRunning ? "Pause" : "Start") {
                timerRunning.toggle()
            }
            .font(.title)
            .padding()
            .background(timerRunning ? Color.red : Color.green)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
        .onReceive(timer) { _ in
           
            if timerRunning && timeRemaining > 0 {
                timeRemaining -= 1
            } else if timeRemaining == 0 {
                
            }
        }
    }

    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct TestTimerView_Previews: PreviewProvider {
    static var previews: some View {
       TestTimerView()
    }
}
