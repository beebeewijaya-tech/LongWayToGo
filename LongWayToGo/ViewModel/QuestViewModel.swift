//
//  QuestViewModel.swift
//  LongWayToGo
//
//  Created by Bee Wijaya on 30/05/26.
//

import SwiftUI
import Combine

struct Quest: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var corectAnswer: String
    var correct: Bool?
}

class QuestViewModel: ObservableObject {
    @Published var quest: [Quest] = [
        Quest(
            title: "Leg 1 · Food",
            description: "What's my all-time favorite food?",
            corectAnswer: "Pizza"
        ),
        Quest(
            title: "Leg 2 · Drink",
            description: "What do I order at a coffee shop every single time?",
            corectAnswer: "Iced latte"
        ),
        Quest(
            title: "Leg 3 · Color",
            description: "What's my favorite color?",
            corectAnswer: "Blue"
        ),
        Quest(
            title: "Leg 4 · Weekend",
            description: "What's my ideal lazy weekend activity?",
            corectAnswer: "Sleeping in"
        ),
        Quest(
            title: "Leg 5 · Pet peeve",
            description: "What's the one thing that always annoys me?",
            corectAnswer: "Being late"
        )
    ]
    @Published var progress: CGFloat = 0.0
    
    var currentQuest: Quest? {
        let q = quest.first(where: { $0.correct == nil})
        return q
    }
    
    func answerQuest(answer: String) {
        guard answer != "" else { return }
        guard var currentQuest else { return }
        
        currentQuest.correct = currentQuest.corectAnswer.lowercased().contains(answer)
        progress += 0.1
    }
}
