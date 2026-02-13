//
//  View+Extensions.swift
//  Powerlyze
//

import SwiftUI

extension View {
    /// Dismisses the keyboard by resigning first responder.
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}
