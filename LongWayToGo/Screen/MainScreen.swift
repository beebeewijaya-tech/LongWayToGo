//
//  MainScreen.swift
//  LongWayToGo
//
//  Created by Bee Wijaya on 29/05/26.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var pageStateVM: PageStateViewModel = PageStateViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("MapNavy"), Color("DeepNight")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            VStack {
                switch pageStateVM.state {
                case .home:
                    HomeScreen()
                default:
                    Text("Hello world")
                }
            }
        }
    }
}


#Preview {
    MainScreen()
}
