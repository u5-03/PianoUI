//
//  AnimatedPianoView.swift
//  PianoUI
//
//  Created by Yugo Sugiyama on 2024/09/01.
//

import SwiftUI
import PianoUICore

public struct AnimatedPianoView: View {
    private let pianoStrokesList: [[PianoKeyStroke]]

    public init(pianoStrokesList: [[PianoKeyStroke]]) {
        self.pianoStrokesList = pianoStrokesList
    }

    public var body: some View {
        PhaseAnimator(pianoStrokesList) { pianoStrokes in
            PianoView(pianoStrokes: pianoStrokes)
        }
    }
}

#Preview {
    AnimatedPianoView(
        pianoStrokesList: [
            [.init(key: .init(keyType: .c, octave: .fifth), velocity: 100, timestampNanoSecond: .now)],
            [.init(key: .init(keyType: .aSharp, octave: .fourth), velocity: 100, timestampNanoSecond: .now)],
            [.init(key: .init(keyType: .g, octave: .fourth), velocity: 100, timestampNanoSecond: .now)],
            [.init(key: .init(keyType: .c, octave: .fifth), velocity: 100, timestampNanoSecond: .now)],
            [.init(key: .init(keyType: .f, octave: .fourth), velocity: 100, timestampNanoSecond: .now)],
            [.init(key: .init(keyType: .c, octave: .fifth), velocity: 100, timestampNanoSecond: .now)],
            [.init(key: .init(keyType: .aSharp, octave: .fourth), velocity: 100, timestampNanoSecond: .now)],
            [.init(key: .init(keyType: .c, octave: .fifth), velocity: 100, timestampNanoSecond: .now)],
            [.init(key: .init(keyType: .f, octave: .fourth), velocity: 100, timestampNanoSecond: .now)],
            [.init(key: .init(keyType: .g, octave: .fourth), velocity: 100, timestampNanoSecond: .now)],
            [.init(key: .init(keyType: .g, octave: .fourth), velocity: 100, timestampNanoSecond: .now)],
             [.init(key: .init(keyType: .aSharp, octave: .fourth), velocity: 100, timestampNanoSecond: .now)],
            [.init(key: .init(keyType: .c, octave: .fifth), velocity: 100, timestampNanoSecond: .now)],
        ]
    )
}

