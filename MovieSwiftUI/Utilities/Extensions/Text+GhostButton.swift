//
//  Text+GhostButton.swift
//  MovieSwiftUI
//
//  Created by Pinedo on 10/06/26.
//

import Foundation
import SwiftUI

extension Text {
    func ghostButton() -> some View {
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(.buttonBorder, lineWidth: 1.5)
            }
    }
}

