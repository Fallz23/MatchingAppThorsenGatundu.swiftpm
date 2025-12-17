import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @AppStorage("wins") private var wins: Int = 0
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
        @State var ease = false
        @State var pictures: [CardClass] = []
        @State var fade = true

        var body: some View {
            NavigationStack {
                VStack {
                    Text("Matcher")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.top)

                    Spacer()

                    Button("Easy mode") {
                        withAnimation(.easeOut(duration: 0.6)) {
                            fade = false
                        }

                        pictures = [
                            CardClass(name: "kane1"), CardClass(name: "kane1"),
                            CardClass(name: "kane2"), CardClass(name: "kane2"),
                            CardClass(name: "kane3"), CardClass(name: "kane3"),
                            CardClass(name: "kane4"), CardClass(name: "kane4"),
                            CardClass(name: "kane5"), CardClass(name: "kane5"),
                            CardClass(name: "kane6"), CardClass(name: "kane6")
                        ].shuffled()

                        ease = true
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .tint(.blue)
                    .opacity(fade ? 1 : 0)

                    Spacer()
                }
                .onAppear {
                    withAnimation(.easeIn(duration: 0.6)) {
                        fade = true
                    }
                }
                .navigationDestination(isPresented: $ease) {
                    EasyView(pictures: $pictures)
                }
            }
        }
    }

    }

