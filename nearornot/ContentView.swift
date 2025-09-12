import SwiftUI

struct ContentView: View {
    @State private var isNear = false

    var body: some View {
        ZStack {
            isNear ? Color.red : Color.green

            Text(isNear ? "近い！" : "遠い")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .ignoresSafeArea()
        .onAppear {
            UIDevice.current.isProximityMonitoringEnabled = true
            NotificationCenter.default.addObserver(
                forName: UIDevice.proximityStateDidChangeNotification,
                object: nil,
                queue: .main
            ) { _ in
                isNear = UIDevice.current.proximityState
            }
        }
        .onDisappear {
            UIDevice.current.isProximityMonitoringEnabled = false
        }
    }
}
