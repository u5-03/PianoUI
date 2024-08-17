//
//  PianoOctaveView.swift
//
//
//  Created by Yugo Sugiyama on 2024/07/01.
//

import SwiftUI
import PianoUICore

struct PianoOctaveView: View {
    let octave: Octave
    let strokedKeyStrokes: [PianoKeyStroke]
    let didTriggerStrokeEvent: ((PianoKeyStroke) -> Void)?

    let whiteKeys = KeyType.allCases.filter(\.isWhiteKey)
    let blackKeys = KeyType.allCases.filter(\.isBlackKey)
    static let keyMargin: CGFloat = 1

    private func whiteKeyWidth(keyboardHeight: CGFloat) -> CGFloat {
        return keyboardHeight * 0.16
    }
    private func blackKeyWidth(keyboardHeight: CGFloat) -> CGFloat {
        return whiteKeyWidth(keyboardHeight: keyboardHeight) * 0.66
    }

    init(octave: Octave, strokedKeyStrokes: [PianoKeyStroke], didTriggerStrokeEvent: ((PianoKeyStroke) -> Void)? = nil) {
        self.octave = octave
        self.strokedKeyStrokes = strokedKeyStrokes
        self.didTriggerStrokeEvent = didTriggerStrokeEvent
    }

    var body: some View {
        GeometryReader { gr in
            ZStack(alignment: .top) {
                LazyHStack(spacing: PianoOctaveView.keyMargin) {
                    ForEach(whiteKeys, id: \.self) { keyType in
                        PianoKeyView.White(
                            pianoKey: .init(
                                keyType: keyType,
                                octave: octave
                            ),
                            keyStrokedType: keyStrokedType(keyType: keyType) ?? .unstroked,
                            didTriggerKeyStrokeEvent: { keyStroke in
                                didTriggerStrokeEvent?(keyStroke)
                            }
                        )
                    }
                }
                LazyHStack(spacing: PianoOctaveView.keyMargin) {
                    ForEach(Array(blackKeys.enumerated()), id: \.element) { index, keyType in
                        HStack(spacing: 0) {
                            PianoKeyView.Black(
                                pianoKey: .init(
                                    keyType: keyType,
                                    octave: octave
                                ),
                                keyStrokedType: keyStrokedType(keyType: keyType) ?? .unstroked,
                                didTriggerKeyStrokeEvent: { keyStroke in
                                    didTriggerStrokeEvent?(keyStroke)
                                }
                            )
                                .shadow(radius: 2)
                                .offset(.init(
                                    width: blackKeyWidth(keyboardHeight: gr.size.height) * keyType.keyOffsetRatio,
                                    height: 0)
                                )
                                .frame(width: blackKeyWidth(keyboardHeight: gr.size.height))
                                .padding(.horizontal, (whiteKeyWidth(keyboardHeight: gr.size.height) - blackKeyWidth(keyboardHeight: gr.size.height)) / 2)

                            if keyType.isNextBlackKeyEmpty {
                                Color.clear
                                    .frame(width: blackKeyWidth(keyboardHeight: gr.size.height))
                                    .padding(.horizontal, (whiteKeyWidth(keyboardHeight: gr.size.height) - blackKeyWidth(keyboardHeight: gr.size.height)) / 2)
                            }
                        }
                    }
                }
                .offset(.init(width: whiteKeyWidth(keyboardHeight: gr.size.height) / 2, height: 0))
                .frame(height: gr.size.height * 0.66)
            }
            .aspectRatio(AspectRatioConstants.octaveAspectRatio, contentMode: .fit)
        }
    }
}

private extension PianoOctaveView {
    func keyStrokedType(keyType: KeyType) -> KeyStrokedType? {
        guard let keyStroke = strokedKeyStrokes.first(
            where: { $0.key.keyType == keyType && $0.key.octave == octave && $0.isOn }
        ) else { return nil }
        return .stroked(percent: keyStroke.velocityPercent)
    }
}

#Preview {
    ZStack {
        PianoOctaveView(
            octave: .fourth,
            strokedKeyStrokes: [
                .init(key: .init(keyType: .c, octave: .fourth), velocity: PianoKeyStroke.minVelocity, timestampNanoSecond: .now, isOn: true),
                .init(key: .init(keyType: .cSharp, octave: .fourth), velocity: 10, timestampNanoSecond: .now, isOn: true),
                .init(key: .init(keyType: .d, octave: .fourth), velocity: 30, timestampNanoSecond: .now, isOn: true),
                .init(key: .init(keyType: .dSharp, octave: .fourth), velocity: 50, timestampNanoSecond: .now, isOn: true),
                .init(key: .init(keyType: .e, octave: .fourth), velocity: 70, timestampNanoSecond: .now, isOn: true),
                .init(key: .init(keyType: .f, octave: .fourth), velocity: 90, timestampNanoSecond: .now, isOn: true),
                .init(key: .init(keyType: .fSharp, octave: .fourth), velocity: 110, timestampNanoSecond: .now, isOn: true),
                .init(key: .init(keyType: .g, octave: .fourth), velocity: PianoKeyStroke.maxVelocity, timestampNanoSecond: .now, isOn: true),
            ]
        )
        .padding()
    }
    .background(.red)
}

