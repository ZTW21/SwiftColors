import GoogleMobileAds
import SwiftUI

class InterstitialAdManager: NSObject, FullScreenContentDelegate, ObservableObject {
    var interstitial: InterstitialAd?
    
    override init() {
        super.init()
        loadAd()
    }
    
    func loadAd() {
        let request = Request()
        InterstitialAd.load(with: "ca-app-pub-3940256099942544/4411468910", request: request) { [weak self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            self?.interstitial = ad
            self?.interstitial?.fullScreenContentDelegate = self
        }
    }
    
    func showAd() {
        if let interstitial = interstitial, let root = UIApplication.shared.windows.first?.rootViewController {
            interstitial.present(from: root)
        } else {
            print("Ad wasn't ready")
            loadAd() // Try loading again if it wasn't ready
        }
    }
    
    // Delegate methods
    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
        loadAd() // Preload the next ad
    }
    
    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad failed to present full screen content with error: \(error.localizedDescription)")
        loadAd()
    }
}
