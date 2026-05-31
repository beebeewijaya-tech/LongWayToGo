//
//  AppPosition.swift
//  LongWayToGo
//
//  Created by Bee Wijaya on 31/05/26.
//

import SwiftUI

enum PositionStyle {
    case primary, secondary, tertiary
    
    var color: Color {
        switch self {
        case .primary:
            return Color("DepartureTeal")
        case .secondary:
            return Color("HerRose")
        case .tertiary:
            return Color("RouteGold")
        }
    }
}

enum PositionSize {
    case small, medium, large
    
    var size: CGFloat {
        switch self {
        case .small:
            return 5
        case .medium:
            return 15
        case .large:
            return 25
        }
    }
}

struct AppPosition: View {
    var style: PositionStyle
    var size: PositionSize
    var label: String
    var animate: Bool = false
    
    @State private var isPulsing = false
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(style.color)
                    .frame(width: size.size + (isPulsing ? 15 : 10))
                    .opacity(isPulsing ? 0.6 : 0.4)
                    .animation(
                        .easeInOut(duration: 0.5)
                        .repeatForever(autoreverses: true),
                        value: isPulsing
                    )
                Circle()
                    .fill(style.color)
                    .frame(width: size.size)
            }
            Text(label)
                .foregroundStyle(Color("FaintBlue"))
                .font(.caption)
                .italic()
                .bold()
        }
        .onAppear {
            Task {
                try? await Task.sleep(for: .seconds(0.2))
                if animate {
                    isPulsing = true
                }
            }
        }
    }
}


#Preview {
    ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        AppPosition(style: .secondary, size: .large, label: "Surabaya", animate: true)
    }
}
