//
//  FontExtension.swift
//  LongWayToGo
//
//  Created by Bee Wijaya on 29/05/26.
//

import SwiftUI

extension View {
    func fraunces(_ size: CGFloat) -> some View {
        self.font(.custom("Fraunces", size: size))
    }
    
    func splineSans(_ size: CGFloat) -> some View {
        self.font(.custom("SplineSans", size: size))
    }
}
