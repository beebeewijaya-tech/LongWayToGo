//
//  PageStateViewModel.swift
//  LongWayToGo
//
//  Created by Bee Wijaya on 29/05/26.
//

import SwiftUI
import Combine

enum PageState {
    case home, plane, anniversary
}


class PageStateViewModel: ObservableObject {
    @Published var state: PageState = .home
    
    func setState(_ state: PageState) {
        withAnimation(.easeInOut(duration: 0.3)) {
            self.state = state
        }
    }
}
