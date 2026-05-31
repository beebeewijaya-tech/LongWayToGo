//
//  AppButton.swift
//  LongWayToGo
//
//  Created by Bee Wijaya on 30/05/26.
//

import SwiftUI

enum ButtonStyle {
    case primary, secondary, tertiary
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            return Color("RouteGold")
        case .secondary:
            return Color("HerRose")
        case .tertiary:
            return Color("MapNavy")
        }
    }
    
    var textColor: Color {
        switch self {
        case .primary:
            return Color("DeepNight")
        case .secondary:
            return .white
        case .tertiary:
            return Color("HerRose")
        }
    }
    
    var borderColor: Color {
        switch self {
        case .primary:
            return .clear
        case .secondary:
            return .clear
        case .tertiary:
            return Color("HerRose")
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .primary:
            return 0
        case .secondary:
            return 0
        case .tertiary:
            return 1
        }
    }
}


struct AppButton: View {
    var label: String
    var style: ButtonStyle
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text(label)
                    .foregroundStyle(style.textColor)
                    .font(.default)
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .padding(8)
            .background(style.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style.borderColor, lineWidth: style.borderWidth)
            )
            .shadow(radius: 12)
        }
    }
}


#Preview {
    AppButton(label: "Answer to fly", style: .primary) {
        
    }
    
    AppButton(label: "Answer to fly", style: .secondary) {
        
    }
    
    AppButton(label: "Answer to fly", style: .tertiary) {
        
    }
}
