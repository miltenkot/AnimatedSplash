//
//  AnimatedLogoView.swift
//  AnimatedSplash
//
//  Created by Bartłomiej on 03/04/2023.
//

import SwiftUI

struct AnimatedLogoView<Content: View>: View {
    /// Splash screen stats.
    enum SplashState: Double {
        case begin = 0, end = 1
    }
    
    /// Opactiy `fullyTransparent` and `fullyOpaque` states.
    enum OpacityState: Double {
        case fullyTransparent = 0, fullyOpaque = 1
    }
    
    @Namespace var ns
    @State private var splashState: SplashState = .begin
    @State private var opacity: OpacityState = .fullyTransparent
    @ViewBuilder var content: () -> Content
    
    private var logo: some View {
        Image("politica_logo")
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "splashAnimation", in: ns)
    }
    
    var body: some View {
        VStack {
            switch splashState {
            case .begin:
                logo
                    .padding()
            case .end:
                VStack {
                    logo
                        .padding(.top, 32)
                        .padding(.horizontal, 100)
                    content()
                        .opacity(opacity.rawValue)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.easeInOut(duration: 1.2)) {
                    splashState = .end
                }
            }
        }
        .onAnimationCompleted(for: splashState.rawValue) {
            opacity = .fullyOpaque
        }
    }
}
