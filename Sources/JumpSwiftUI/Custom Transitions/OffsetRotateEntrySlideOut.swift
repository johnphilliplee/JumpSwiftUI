import Foundation
import SwiftUI

@available(iOS 13.0, *)
public extension AnyTransition {
    static var offsetRotatingEntrySlideOut: AnyTransition {
        .modifier(
            active: TransformModifier(degrees: 1800),
            identity: TransformModifier(degrees: 0.001)
        )
    }
    
    static func offsetRotatingEntrySlideOut(degrees: Double) -> AnyTransition {
        .modifier(
            active: TransformModifier(
                degrees: degrees,
                offset: CGPoint(x: 200, y: 200),
                scale: 0.001
            ),
            identity: TransformModifier(
                degrees: 0)
            )
        
    }
}
