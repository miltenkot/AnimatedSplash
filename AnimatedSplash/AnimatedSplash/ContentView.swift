//
//  ContentView.swift
//  AnimatedSplash
//
//  Created by Bartłomiej on 02/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            
            AnimatedLogoView {
                VStack {
                    Image("image_example")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Text("Welcome")
                        .font(.title)
                        .bold()
                    Spacer()
                    Text("Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Button 1")
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.black)
                    
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
