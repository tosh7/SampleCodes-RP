import SwiftUI

struct CombineView: View {
    @StateObject var viewModel: CombineViewModel = CombineViewModel()

    init() {

    }

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct CombineView_Previews: PreviewProvider {
    static var previews: some View {
        CombineView()
    }
}
