## PianoUI


This package provides PianoUI view.
<img src=Assets/pianoView.png  width=75%>  

### How to use.

#### PianoKeyStroke
This package defines musical information as `PianoKeyStroke`.
`PianoKeyStroke` has below properties.
1. pianoKey: `PianoKey` struct  
      1. `PianoKey` struct  
        1. `PianoKey` enum: 🎵CDEFGAB  
        2. `Octave` enum: -1 ~ 9 octave
3. `velocity` Int: Strength of sound
4. `timestampNanoSecond` UInt64: Timestamp(This is used when connected with MIDI devices)
5. `isOn` Bool: Whethere is piano key is stroked or not

#### PianoView

- Show only PianoView.
```swift
PianoView()
```
- If you want to highlight specific keys, pass Array of `PianoKeyStroke` to pianoStrokes parameter.
```swift
PianoView(
    pianoStrokes: [
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
```

- If you want to show specific key position as center, pass `PianoKey` to `centerDisplayKey` parameter.

```swift
PianoView(
    centerDisplayKey: PianoKey(keyType: .c, octave: .fourth)
)
```

#### AnimatedPianoView
If you want to highlight keys in order, pass Array of Array of `PianoKeyStroke` to `pianoStrokesList` parameter.

https://github.com/user-attachments/assets/9621b398-5518-47dc-b758-1554c91d5d96

```swift
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
```
