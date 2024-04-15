//
//  FlipPanelView.swift
//  tomato
//
//  Created by Vineeth Vajipey on 4/13/24.
//
import SwiftUI

struct FlipPanelView: View {
    @Binding var num: Int
    @Binding var num2: Int
    @Binding var num3: Int
    @Binding var num4: Int
    @Binding var start: Bool
    @Binding var end: Bool

    var body: some View {
        ZStack {
            RoundedRec()
            number(num: num)
            ZStack {
                RoundedRec()
                number(num: num2, color: .blue)
            }
            .mask {
                RoundedRec(height: 120)
                    .offset(y: -60)
            }
            .rotation3DEffect(.degrees(start ? 90 : 0), axis: (x: -1, y: 0, z: 0), anchor: .center, anchorZ: 0, perspective: 0.5)
            ZStack {
                RoundedRec()
                number(num: num3, color: .yellow)
            }
            .mask {
                RoundedRec(height: 120)
                    .offset(y: 60)
            }
            ZStack {
                RoundedRec()
                number(num: num4, color: .green)
            }
            .mask {
                RoundedRec(height: 120)
                    .offset(y: 60)
            }
            .rotation3DEffect(.degrees(end ? 0 : 90), axis: (x: 1, y: 0, z: 0), anchor: .center, anchorZ: 0, perspective: 0.6)
        }
        .overlay(content: {
            Rectangle()
                .frame(height: 3)
                .offset(y: 1.5)
        })
    }
}

struct RoundedRec: View {
    var width: CGFloat = 80
    var height: CGFloat = 90
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(width: width, height: height)
            .foregroundColor(Color("fc"))
    }
}

struct number: View {
    var num = 0
    var color = Color(.red)
    var body: some View {
        Text("\(num)").font(.system(size: 90))
            .foregroundColor(color)
    }
}

struct FlipPanelView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
