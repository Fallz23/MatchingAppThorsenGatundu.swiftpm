import SwiftUI
import SwiftData

struct ContentView: View {
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeTab()
                .tag(0)
                .tabItem {
                    Label("Matching", systemImage: "square.grid.2x2")
                }
            
            StatsView()
                .tag(1)
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
        }
    }
    
    struct HomeTab: View {
        @State var pictures: [CardClass] = [CardClass(picture: Image("kane1")),CardClass(picture: Image("kane2")), CardClass(picture: Image("kane3")), CardClass(picture: Image("kane4")), CardClass(picture: Image("kane5")), CardClass(picture: Image("kane6"))]
        var body: some View {
            NavigationStack {
                VStack {
                    Text("Matcher")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.top)
                    Spacer()
                    NavigationLink("Easy mode") {
                        EasyView(pictures: $pictures)
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        }
    }
}
