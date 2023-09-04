//
//  CustomNavBarContainer.swift
//  ShotInTime
//
//  Created by Александр Полочанин on 4.09.23.
//

import SwiftUI

struct CustomNavigationBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String = "" // ""
    @State private var subtitle: String? = nil
    
    init(@ViewBuilder content: () -> Content ) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBarView(showBackButton: showBackButton, title: title, subtitle: subtitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self) { value in
            self.subtitle = value
        }
        .onPreferenceChange(CustomNavBarBackButtonPreferenceKey.self) { value in
            self.showBackButton = !value
        }
    }
}

struct CustomNavBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBarContainerView() {
            ZStack {
                Color.green.ignoresSafeArea()
                
                Text("hello")
                    .foregroundColor(.black)
                    .customNavigationTitle("New Title")
                    .customNavigationSubtitle("subtitlt")
                    .customNavigationBarBackButtonHidden(false)
            }
        }
    }
}
