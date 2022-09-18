import Foundation
import SwiftUI

@available(iOS 15.0, *)
public struct FullWidthButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .maxWidth()
            .foregroundColor(.white)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.tint)
            }
    }
}

@available(iOS 14.0, *)
public extension View {
    func maxWidth() -> some View {
        frame(maxWidth: .infinity)
    }
}
