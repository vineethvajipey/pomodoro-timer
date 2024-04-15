//
//  ContentView.swift
//  tomato
//
//  Created by Vineeth Vajipey on 3/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var start = false
    @State var end = false
    @State var num = 9
    @State var num2 = 9
    @State var num3 = 9
    @State var num4 = 9
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Color.black
            VStack {
                HStack {
                    FlipPanelView(num: $num, num2: $num2, num3: $num3, num4: $num4, start: $start, end: $end)
                        .onReceive(timer) { _ in
                            updateNumbers()
                        }
//                    FlipPanelView(num: $num, num2: $num2, num3: $num3, num4: $num4, start: $start, end: $end)
//                        .onReceive(timer) { _ in
//                            updateNumbers()
//                        }
//                    FlipPanelView(num: $num, num2: $num2, num3: $num3, num4: $num4, start: $start, end: $end)
//                        .onReceive(timer) { _ in
//                            updateNumbers()
//                        }
//                    FlipPanelView(num: $num, num2: $num2, num3: $num3, num4: $num4, start: $start, end: $end)
//                        .onReceive(timer) { _ in
//                            updateNumbers()
//                        }
                }
                Button(action: updateNumbers) {
                    Text("Start")
                }
            }
        }
        .ignoresSafeArea()
    }
            
    func updateNumbers() {
        if num > 0 {
            num -= 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                num3 -= 1
            }
            withAnimation(.spring().speed(3)) {
                start.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                start = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                num2 -= 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                num4 -= 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring().speed(3)) {
                    end = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                end = false
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
