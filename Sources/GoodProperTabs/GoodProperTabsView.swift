/*
 The source code was created by Jerome on 08/07/2024 (https://github.com/jmuzet/myCustomTabView)
 Sedoykin Alexey only made improvements to the use of icons and turned it all into a Package
 */

import SwiftUI

public struct GoodProperTabsView: View {
    private let titles: [String]
    private let icons: [String]
    private let tabViews: [AnyView]
    
    @State private var selection = 0
    @State private var indexHovered = -1
    
    public init(content: [(title: String, icon: String, view: AnyView)]) {
        self.titles = content.map{ $0.title }
        self.icons = content.map{ $0.icon }
        self.tabViews = content.map{ $0.view }
    }
    
    public var tabBar: some View {
        HStack {
            Spacer()
            ForEach(0..<titles.count, id: \.self) { index in
                VStack {
                    //Sedoykin Alexey changed it
                    if icons[index].hasPrefix("system:") {
                        Image(systemName: String(icons[index].dropFirst(7)))
                            .font(.largeTitle)
                    } else {
                        Image(icons[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    Text(self.titles[index])
                }
                .frame(height: 30)
                .padding(15)
                .background(Color.gray.opacity(((self.selection == index) || (self.indexHovered == index)) ? 0.3 : 0),
                            in: RoundedRectangle(cornerRadius: 8, style: .continuous))

                .frame(height: 80)
                .padding(.horizontal, 0)
                .foregroundColor(
                    self.selection == index
                    ? Color(red: 0.0, green: 0.4, blue: 0.92)
                    : Color(red: 0.42, green: 0.43, blue: 0.43)
                )
                .onHover(perform: { hovering in
                    if hovering {
                        indexHovered = index
                    } else {
                        indexHovered = -1
                    }
                })
                .onTapGesture {
                    self.selection = index
                }
            }
            Spacer()
        }
        .padding(0)
        //.background(Color("SettingsV1"))
        .background(Color(red: 240.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
    }

    public var body: some View {
        VStack(spacing: 0) {
            tabBar

            tabViews[selection]
                .padding(0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(0)
        .frame(width: 600, height: 400) // Set window size
        .onAppear {
            // Bring the app to the front
            NSApp.activate(ignoringOtherApps: true)
        }
    }
}

//for testing purpose
#Preview {
    GoodProperTabsView(content: [
        (title: "Tab 1", icon: "someCustomIconFormAssests", view: AnyView(Text("Tab #1"))),
        (title: "Tab 2", icon: "system:apple.logo", view: AnyView(Text("Tab #2"))),
        (title: "Tab 3", icon: "system:apple.logo", view: AnyView(Text("Tab #3")))
    ])
}
