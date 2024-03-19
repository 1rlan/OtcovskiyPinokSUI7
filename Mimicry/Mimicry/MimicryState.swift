//
//  CardState.swift
//  Mimicry
//
//  Created by Irlan Abushakhmanov on 19.03.2024.
//

import SwiftUI

enum MimicryState {
    case small
    case big

    mutating func toggle() {
        switch self {
        case .small: self = .big
        case .big: self = .small
        }
    }

    var zStackAlignment: Alignment {
        switch self {
        case .small: return .center
        case .big: return .topLeading
        }
    }

    var size: (width: CGFloat, height: CGFloat) {
        switch self {
        case .small: return (90, 60)
        case .big: return (.infinity, 360)
        }
    }

    @ViewBuilder
    var label: some View {
        switch self {
        case .small:
            Text("Open")
        case .big:
            Label("Back", systemImage: "arrowshape.backward.fill")
        }
    }
}
