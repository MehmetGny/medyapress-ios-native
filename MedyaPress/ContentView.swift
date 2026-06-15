import SwiftUI
import WebKit

struct ContentView: View {
    @StateObject private var model = WebViewModel()

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                Text("MP")
                    .font(.headline.bold())
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                    .background(Color(red: 245/255, green: 130/255, blue: 32/255))
                    .cornerRadius(13)
                VStack(alignment: .leading, spacing: 2) {
                    Text("MedyaPress Mobil Uygulaması").font(.headline.bold())
                    Text("Dünyayı Sizin İçin Takip Ediyoruz!").font(.caption2).foregroundColor(.secondary)
                }
                Spacer()
                Button { model.goBack() } label: { Image(systemName: "chevron.left") }.disabled(!model.canGoBack)
                Button { model.reload() } label: { Image(systemName: "arrow.clockwise") }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)

            WebView(model: model)
                .ignoresSafeArea(edges: .bottom)
        }
    }
}
