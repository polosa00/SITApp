//
//  CustomNavigationBarView.swift
//  ShotInTime
//
//  Created by Александр Полочанин on 4.09.23.
//

import SwiftUI

struct CustomNavigationBarView: View {
    @Environment(\.presentationMode) var presentationMode
    var showBackButton: Bool
    var title: String
    var subtitle: String?
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
                
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(Color(red: 1, green: 0.97, blue: 0.87))
        .font(.headline)
        .background(Color.black.ignoresSafeArea(edges: .top))
    }
}

struct CustomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavigationBarView(showBackButton: true, title: "Title here", subtitle: "Subtitle goes here")
            Spacer()
        }
    }
}

extension CustomNavigationBarView {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}
