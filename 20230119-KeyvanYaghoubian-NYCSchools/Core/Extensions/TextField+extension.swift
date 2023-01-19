//
//  TextField+extension.swift
//  NYC HighSchools
//
//  Created by Keyvan  on 1/17/23.

import Foundation
import SwiftUI


extension View {
    
    /// Addes Placeholder to TextFields
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }

    }
}
