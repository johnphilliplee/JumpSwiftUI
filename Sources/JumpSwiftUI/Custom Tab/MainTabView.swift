import SwiftUI

@available(iOS 14.0, *)
struct MainTabView<SelectionValue: FloatingTabBarItem>: View {
    let tabs: [SelectionValue]
    @Binding var selection: SelectionValue
    @Namespace var namespace
    @State private var localSelection: SelectionValue?
    
    var body: some View {
        tabView
            .onChange(of: selection) { value in
                withAnimation(.easeInOut) {
                    localSelection = value
                }
            }
    }
}

@available(iOS 14.0, *)
extension MainTabView {
    init(tabs: [SelectionValue], selection: Binding<SelectionValue>) {
        self.tabs = tabs
        self._selection = selection
    }
}

@available(iOS 14.0, *)
extension MainTabView {
    private var tabView: some View {
        HStack (spacing: 4) {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab)
                    .onTapGesture {
                        select(tab: tab)
                    }
            }
        }
        .padding(8)
        .background(
            Color.white.edgesIgnoringSafeArea(.bottom)
        )
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
        .onAppear {
            localSelection = _selection.wrappedValue
        }
    }
    
    func tabView(_ tab: SelectionValue) -> some View {
        let selected = tab == localSelection
        
        return VStack(spacing: 4) {
            Image(systemName: tab.imageName)
                .font(.headline)
            Text(tab.text)
                .font(.caption)
        }
        .foregroundColor(selected ? tab.color : Color.gray)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(
            ZStack {
                if selected {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "bg_selected", in: namespace)
                }
            }
        )
    }
}

@available(iOS 14.0, *)
extension MainTabView {
    private func select(tab: SelectionValue) {
        selection = tab
    }
}
