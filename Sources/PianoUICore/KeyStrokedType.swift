//
//  KeyStrokedType.swift
//  PianoUI
//
//  Created by Yugo Sugiyama on 2024/08/08.
//

public enum KeyStrokedType {
    case unstroked
    case stroked(percent: Int)

    public var isStroked: Bool {
        switch self {
        case .unstroked: return false
        case .stroked: return true
        }
    }

    public var velocityPercent: Int {
        switch self {
        case .unstroked: return 0
        case .stroked(let percent):
            return percent
        }
    }
}
