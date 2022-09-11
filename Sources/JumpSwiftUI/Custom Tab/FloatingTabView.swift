import SwiftUI

@available(iOS 14.0, *)
public protocol FloatingTabBarItem: Hashable {
    var text: String { get }
    var imageName: String { get }
    var color: Color { get }
}

@available(iOS 14.0, *)
public struct FloatingTabView<SelectionValue: FloatingTabBarItem, Content: View>: View {
    public init(selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    @Binding var selection: SelectionValue
    var content: Content
    @State private var tabItems: [SelectionValue] = []
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            content
                .edgesIgnoringSafeArea(.all)
            MainTabView(tabs: tabItems, selection: $selection)
        }
        .onPreferenceChange(FloatingTabViewPreferenceKey.self) { value in
            tabItems = value
        }
    }
}
