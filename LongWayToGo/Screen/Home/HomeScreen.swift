//
//  HomeScreen.swift
//  LongWayToGo
//
//  Created by Bee Wijaya on 29/05/26.
//

import SwiftUI


struct HomeScreen: View {
    
    // MARK: - ViewModel
    @EnvironmentObject private var questVM: QuestViewModel
    
    // MARK: - State
    private var appPositions: [(style: PositionStyle, size: PositionSize, animate: Bool, label: String)] = [
        (.secondary, .large, true, "Surabaya"),
        (.tertiary, .small, false, ""),
        (.tertiary, .small, false, ""),
        (.tertiary, .small, false, ""),
        (.tertiary, .small, false, ""),
        (.tertiary, .small, false, ""),
        (.primary, .large, false, "Your Position")
    ]
    @State private var planePosition = CGFloat(5) // 1 - 5, works backward
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("The Long Way to You")
                    .fraunces(26)
                    .foregroundStyle(Color("SkyText"))
                    .padding(.bottom, 4)
                
                Text("Leg 6 of 10 · crossing the South China Sea")
                    .splineSans(16)
                    .foregroundStyle(Color("Dusk"))
            }
            .padding(.bottom, 12)
            
            VStack {
                ZStack(alignment: .leading) {
                    GeometryReader { geo in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("SeaGlow"))
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(colors: [Color("RouteGold"), Color("HerRose")], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: geo.size.width * questVM.progress)
                    }
                    .frame(height: 10)
                }
            }
            .padding(10)
            
            Spacer()

            VStack(alignment: .leading) {
                GeometryReader { geo in
                    let gap = CGFloat(appPositions.count - 1)
                    
                    ForEach(0..<appPositions.count, id: \.self) { i in
                            let x = geo.size.width - (geo.size.width / gap) * CGFloat(i)
                            let y = (geo.size.height / gap) * CGFloat(i)
                        
                        AppPosition(style: appPositions[i].style, size: appPositions[i].size, label: appPositions[i].label, animate: appPositions[i].animate)
                            .position(x: x, y: y)
                    }
                    
                    ZStack(alignment: .topTrailing) {
                          Image(systemName: "airplane")
                              .font(.title)
                              .foregroundStyle(Color("RouteGold"))
                              .bold()
                              .rotationEffect(.degrees(-50))

                          Image(systemName: "heart.fill")
                              .font(.system(size: 14))
                              .foregroundStyle(Color("Cream"))
                              .offset(x: -10, y: -10)
                      }
                      .position(
                          x: geo.size.width - (geo.size.width / gap) * CGFloat(planePosition),
                          y: (geo.size.height / gap) * CGFloat(planePosition)
                      )

                }
                .padding()
                .frame(height: 350)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("First city I ever flew to just to see you for one weekend?")
                    .fraunces(18)
                    .foregroundStyle(Color("SkyText"))
                    .padding(.bottom, 4)
                
                Text("get it right and the plane moves one leg closer 😏")
                    .foregroundStyle(Color("Dusk"))
                    .splineSans(12)
                    .padding(.bottom, 16)
                
                AppButton(label: "Answer to fly", style: .secondary) {
                    
                }
            }
            .padding(24)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("FaintBlue"), lineWidth: 1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .padding(.horizontal, 20)
    }
}

#Preview {
    ZStack(alignment: .top) {
        LinearGradient(colors: [Color("MapNavy"), Color("DeepNight")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
            .overlay {
                Image("grid_bg")
            }
        
        HomeScreen()
    }
    .environmentObject(QuestViewModel())
}
