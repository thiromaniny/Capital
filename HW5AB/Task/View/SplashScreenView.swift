//
//  SplashScreenView.swift
//  Task
//
//  Created by sam on 7/3/24.
//

import SwiftUI

// MARK: - SplashScreenView

struct SplashScreenView: View {
    // State properties to manage the view's state.
    @State private var isActive = false // A boolean to control whether the splash screen should transition to the main content view.
    @State private var scale = 0.8 // A floating-point number to control the scaling of the text.
    @State private var opacity = 0.5 // A floating-point number to control the opacity of the text.

    var body: some View {
        VStack {
            // The main text displayed on the splash screen.
            Text("Task App for to Do List ")
                .font(.largeTitle) // Set the font size to large title.
                .fontWeight(.bold) // Make the font weight bold.
                .foregroundColor(.blue) // Set the text color to blue.
                .scaleEffect(scale) // Apply the scale effect using the scale state property.
                .opacity(opacity) // Apply the opacity effect using the opacity state property.
                .onAppear {
                    // Animate the scaling and opacity when the view appears.
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.scale = 0.9
                        self.opacity = 1.0
                    }
                }
        }
        .onAppear {
            // Delay the transition to the main content view by 2 seconds.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true // Set isActive to true to trigger the full screen cover.
                }
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            // Present the ContentView as a full screen cover when isActive is true.
            ContentView()
        }
    }
}
