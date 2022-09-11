import Foundation
import SwiftUI

@available(iOS 14.0, *)
struct FloatingTabViewPreferenceKey<SelectionValue: FloatingTabBarItem>: PreferenceKey {
    static var defaultValue: [SelectionValue] {
        [SelectionValue]()
    }
    
    static func reduce(value: inout [SelectionValue], nextValue: () -> [SelectionValue]) {
        value += nextValue()
    }
}

@available(iOS 14.0, *)
struct TabBarItemModifier<SelectionValue: FloatingTabBarItem>: ViewModifier {
    var tab: SelectionValue
    @Binding var selection: SelectionValue
    
    func body(content: Content) -> some View {
        content
            .opacity(tab == selection ? 1.0 : 0.0)
            .preference(key: FloatingTabViewPreferenceKey.self, value: [tab])
    }
}

@available(iOS 14.0, *)
extension View {
    func tabBarItem<SelectionValue: FloatingTabBarItem>(tab: SelectionValue, selection: Binding<SelectionValue>) -> some View {
        modifier(TabBarItemModifier(tab: tab, selection: selection))
    }
}
