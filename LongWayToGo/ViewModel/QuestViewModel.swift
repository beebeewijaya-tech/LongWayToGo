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
    var multipleChoice: [String]
}

class QuestViewModel: ObservableObject {
    @Published var quest: [Quest] = [
        Quest(
            title: "Leg 1 · Food",
            description: "What's my all-time favorite food?",
            corectAnswer: "Pizza",
            multipleChoice: [
                "Yong Tau Foo",
                "Yakiniku",
                "Steak"
            ]
        ),
        Quest(
            title: "Leg 2 · Drink",
            description: "What do I order at a coffee shop every single time?",
            corectAnswer: "Americano",
            multipleChoice: [
                "Americano",
                "Latte",
                "Magic",
            ]
        ),
        Quest(
            title: "Leg 3 · Moment",
            description: "What's the funniest moment in our trip?",
            corectAnswer: "Singapore Universal Incident",
            multipleChoice: [
                "Singapore Universal Incident",
                "Penang Cab to the beach",
                "Kuala Lumpur genting trip"
            ]
        ),
        Quest(
            title: "Leg 4 · Weekend",
            description: "What's our ideal lazy weekend activity?",
            corectAnswer: "Food Hunting",
            multipleChoice: [
                "Walking to mall",
                "Drive without any direction and purpose",
                "Food Hunting"
            ]
        ),
        Quest(
            title: "Leg 5 · Pet peeve",
            description: "What's the one thing that always annoys both of us?",
            corectAnswer: "Queue",
            multipleChoice: [
                "Being late",
                "Queue",
                "Parking",
            ]
        ),
    ]
    @Published var progress: CGFloat = 0.0
    @Published var score: Int = 0
    
    var currentQuest: Quest? {
        let q = quest.first(where: { $0.correct == nil})
        return q
    }
    
    func answerQuest(answer: String) {
        guard answer != "" else { return }
        guard let q = quest.firstIndex(where: { $0.correct == nil }) else { return }

        let correct = quest[q].corectAnswer.lowercased().contains(answer.lowercased())
        quest[q].correct = correct
        score = correct ? score + 1 : score
        
        progress += 0.2
    }
    
    func reset() {
        quest = quest.map {
            var quest = $0
            quest.correct = nil
            return quest
        }
        progress = 0.0
    }
}
