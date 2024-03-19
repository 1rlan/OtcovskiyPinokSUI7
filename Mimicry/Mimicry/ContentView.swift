//
//  ContentView.swift
//  Mimicry
//
//  Created by Irlan Abushakhmanov on 19.03.2024.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var namespace
    @State private var state: MimicryState = .small

    var body: some View {
        Group {
            if state == .big {
                Mimicry()
            } else if state == .small {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Mimicry()
                    }
                }
            }
        }
        .padding()
    }

    private func Mimicry() -> some View {
        ZStack(alignment: state.zStackAlignment) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.blue)
                .matchedGeometryEffect(id: "background", in: namespace, properties: .frame)

            Button {
                changeState()
            } label: {
                state.label
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .matchedGeometryEffect(id: "foreground", in: namespace, properties: .position)
            }
        }
        .frame(maxWidth: state.size.width, maxHeight: state.size.height)
    }

    private func changeState() {
        withAnimation {
            state.toggle()
        }
    }
}

#Preview {
    ContentView()
}
