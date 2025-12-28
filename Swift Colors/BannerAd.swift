//
//  BannerAd.swift
//  Swift Colors
//
//  Created by Zack Wilson on 12/27/25.
//

import SwiftUI
import GoogleMobileAds

struct BannerAd: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let view = BannerView(adSize: AdSizeBanner)
        let viewController = UIViewController()
        view.adUnitID = "ca-app-pub-6185838911408177/9768673955" // Test Ad Unit ID
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: AdSizeBanner.size)
        view.load(Request())
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
