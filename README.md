The **GoodProperTabs** is a package to simplify the creation of tabs in a SwiftUI application for macOS.

This package was created 99.99% thanks to **Jerome** and his excellent example:
https://github.com/jmuzet/myCustomTabView
It demonstrates a classic approach to placing tabs in an application window.


**How to use:**

```
import SwiftUI
import GoodProperTabs
struct ContentView: View {
    var body: some View {
        GoodProperTabsView(content: [
                    //OOTB icon from SF, system:sf_icon_name
                    (title: "Tab 1", icon: "system:apple.logo", view: AnyView(CustomTabContent())),
                    //CUSTOM icon from Assets.xcassets
                    (title: "Tab 2", icon: "iconFromAssets.xcassets", view: AnyView(Text("Tab #01"))),
                    //OOTB icon from SF, system:sf_icon_name
                    (title: "Tab 3", icon: "system:apple.logo", view: AnyView(Text("Tab #22")))
                ])
    }
}

#Preview {
    ContentView()
}
```

**CustomTabContent - TabsContent.swift:**

```
import SwiftUI

struct CustomTabContent: View {
    var body: some View {
        Text("CustomTabContent")
            .font(.title2)
        Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
        }
    }
}
```

**Key Moments:**


//OOTB icon from SF, system:sf_icon_name


(title: "Tab 1", **icon: "system:apple.logo"**, view: AnyView(CustomTabContent())),


//CUSTOM icon from Assets.xcassets


(title: "Tab 2", **icon: "iconFromAssets.xcassets"**, view: AnyView(Text("Tab #01"))),


//OOTB icon from SF, system:sf_icon_name


(title: "Tab 3", **icon: "system:apple.logo"**, view: AnyView(Text("Tab #22")))
