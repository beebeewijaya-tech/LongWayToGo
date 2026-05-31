//
//  FailedScreen.swift
//  LongWayToGo
//
//  Created by Bee Wijaya on 31/05/26.
//

import SwiftUI

struct FailedScreen: View {
    // MARK: - ViewModel
    @EnvironmentObject private var pageStateVM: PageStateViewModel
    @EnvironmentObject private var questVM: QuestViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "heart.slash.fill")
                .foregroundStyle(Color("HerRose"))
                .font(.system(size: 56))
                .padding(.bottom, 20)
            
            Text("You failed")
                .font(.title)
                .bold()
                .foregroundStyle(Color("Cream"))
                .padding(.bottom, 12)

            Text("\"I can't imagine that you failed from this, but i hope you try again.\"")
                .foregroundStyle(Color("RouteGold"))
                .bold()
                .padding(.bottom, 16)
                .italic()
            
            AppButton(label: "Try again", style: .primary) {
                questVM.reset()
                pageStateVM.setState(.home)
            }
            
            Spacer()
        }
        .padding(20)
    }
}

#Preview {
    ZStack(alignment: .top) {
        LinearGradient(colors: [Color("MapNavy"), Color("DeepNight")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
            .overlay {
                Image("grid_bg")
            }
        
        FailedScreen()
    }
    .environmentObject(QuestViewModel())
}
