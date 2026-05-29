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
        self.state = state
    }
}
