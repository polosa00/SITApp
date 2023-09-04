//
//  CustomNavigationLink.swift
//  ShotInTime
//
//  Created by Александр Полочанин on 4.09.23.
//

import SwiftUI



struct CustomNavigationLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    
    var body: some View {
        NavigationLink (
           destination:
            CustomNavigationBarContainerView(content: {
                destination
            })
            .toolbar(.hidden)
            ,
           label: {
            label
        })

    }
}

struct CustomNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView {
            CustomNavigationLink(
                destination: Text("Пункт назначения")) {
                    Text("Нажми меня")
                }
        }
    }
}
