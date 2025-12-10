import SwiftUI
import SwiftData


struct ContentView: View {
 //   @Environment(\.modelContext) var context
//    @State var kaneImage: [Image] = [Image("kane1"), Image("kane2"),Image("kane3"), Image("kane4"), Image("kane5"), Image("kane6")]
    var body: some View {
        NavigationStack{
            VStack {
                Text("Matcher")
                    .font(.headline)
                Spacer()
                
                NavigationLink("Easy mode", destination: EasyView())
                
                
                Spacer()
                
                NavigationLink("View your stats", destination: StatsView())
                
                
               
                
            }
        }
    }
}


