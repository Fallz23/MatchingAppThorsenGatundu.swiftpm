import SwiftUI
import SwiftData

struct EasyView: View {

    @Environment(\.modelContext) var context
    @State var win: Bool = false
    @Binding var pictures: [CardClass]
    @AppStorage("wins") private var wins: Int = 0
    @State var selectedIndex1: Int? = nil
    @State var selectedIndex2: Int? = nil
    @State var waiting = false

    @State var timer: Int = 0

    var body: some View {
        NavigationStack {
            Text("Easy mode")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.top)

            // shows at top of screen after title, before wins
            Text("Time: \(timer)")
                .font(.title2)
                .fontWeight(.medium)

            Text("\(wins)")

            Spacer()

            VStack(spacing: 10) {
                let rows = (pictures.count + 2) / 3

                ForEach(0..<rows, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(0..<3, id: \.self) { column in
                            let index = row * 3 + column

                            if index < pictures.count {
                                Button {
                                    cardTapped(index)
                                } label: {
                                    if pictures[index].isFaceUp {
                                        pictures[index].picture
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                    } else {
                                        pictures[index].back
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                    }
                                }
                            } else {
                                Color.clear
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
                }
            }

            Spacer()
                .toolbar(.hidden, for: .tabBar)
                .navigationDestination(isPresented: $win) {
                    WinView()
                }
        }
            
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if !win {
                timer += 1
            }
        }
        .onAppear {
            timer = 0
        }
    }

    func cardTapped(_ index: Int) {

        if waiting { return }
        if pictures[index].isFaceUp { return }
        if selectedIndex1 != nil && selectedIndex1 == index { return }

        pictures[index].isFaceUp = true

        if selectedIndex1 == nil {
            selectedIndex1 = index
        } else if selectedIndex2 == nil {
            selectedIndex2 = index
            checkMatch()
        }
    }

    func checkMatch() {

        if selectedIndex1 == nil || selectedIndex2 == nil { return }

        let i1 = selectedIndex1!
        let i2 = selectedIndex2!

        if pictures[i1].name == pictures[i2].name {

            waiting = true

            let id1 = pictures[i1].id
            let id2 = pictures[i2].id

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {

                pictures.removeAll { card in
                    card.id == id1 || card.id == id2
                }

                selectedIndex1 = nil
                selectedIndex2 = nil
                waiting = false

                if pictures.count == 0 {
                    win = true
                    wins += 1
                }
            }

        } else {
            waiting = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

                pictures[i1].isFaceUp = false
                pictures[i2].isFaceUp = false

                selectedIndex1 = nil
                selectedIndex2 = nil
                waiting = false
            }
        }
    }
}
