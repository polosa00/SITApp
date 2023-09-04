//
//  CustomNavigationView.swift
//  ShotInTime
//
//  Created by Александр Полочанин on 4.09.23.
//

import SwiftUI

struct CustomNavigationView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            CustomNavigationBarContainerView {
                content
            }
            .toolbar(.hidden)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView {
            Color.red.ignoresSafeArea()
        }
    }
}

extension UINavigationController {
     
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
