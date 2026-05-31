//
//  AnniversaryScreen.swift
//  LongWayToGo
//
//  Created by Bee Wijaya on 31/05/26.
//

import SwiftUI


struct AnniversaryScreen: View {
    // MARK: - ViewModel
    @EnvironmentObject private var pageStateVM: PageStateViewModel
    @EnvironmentObject private var questVM: QuestViewModel
    
    // MARK: - State
    @State private var isPulse = false
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color("HerRose"))
                    .blur(radius: isPulse ? 100 : 50)
                    .opacity(isPulse ? 0.4 : 0.2)
                    .animation(.easeInOut(duration: 1.0).repeatForever(), value: isPulse)
                    .onAppear {
                        isPulse = true
                    }
                
                VStack {
                    HStack {
                        Image(systemName: "1.circle.fill")
                            .foregroundStyle(Color("Cream"))
                        Image(systemName: "0.circle")
                            .foregroundStyle(Color("Cream"))
                        Text("years")
                            .font(.caption)
                            .textCase(.uppercase)
                            .foregroundStyle(Color("Cream"))
                            .monospaced()
                    }
                    .padding(.bottom, 20)
                    Text("Excellent · 5 questions · you made it!")
                        .font(.caption)
                        .textCase(.uppercase)
                        .foregroundStyle(Color("FaintBlue"))
                        .monospaced()
                        .padding(.bottom, 4)
                    
                    Text("Happy Anniversary")
                        .fraunces(48)
                        .bold()
                        .italic()
                        .foregroundStyle(Color("Cream"))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 12)

                    Text("\"Took the long way every single time. Would book the flight again tomorrow.\"")
                        .foregroundStyle(Color("RouteGold"))
                        .bold()
                        .padding(.bottom, 16)
                        .italic()

                    Text("✦ written from your legs of the trip")
                        .font(.caption)
                        .textCase(.uppercase)
                        .foregroundStyle(Color("FaintBlue"))
                        .monospaced()
                        .padding(.bottom, 4)
                        .bold()
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 48)
    }
}


#Preview {
    ZStack(alignment: .top) {
        LinearGradient(colors: [Color("MapNavy"), Color("DeepNight")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
            .overlay {
                Image("grid_bg")
            }
        
        AnniversaryScreen()
    }
    .environmentObject(QuestViewModel())
}
