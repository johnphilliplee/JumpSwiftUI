import SwiftUI

public struct TransformModifier: ViewModifier {
    let degrees: Double
    var offset: CGPoint = .zero
    var scale: Double = 1
    
    @available(iOS 13.0, *)
    public func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .rotationEffect(.degrees(degrees))
            .offset(x: offset.x, y: offset.y)
    }
}
