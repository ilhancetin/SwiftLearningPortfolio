//
//  StoryBrain.swift
//  Destination
//
//  Created by I L H A N on 02.05.2022.
//


import Foundation

struct StoryBrain{
    var currentStory = 0
    let Storys = [
        Story(
            _title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.",
            _choice1: "I'll hop in. Thanks for the help!", _choice1Destination: 2,
            _choice2: "Better ask him if he's a murderer first.", _choice2Destination: 1
    ),
    Story(
        _title: "He nods slowly, unfazed by the question.",
        _choice1: "At least he's honest. I'll climb in.", _choice1Destination: 2,
        _choice2: "Wait, I know how to change a tire.", _choice2Destination: 3
    ),
    Story(
        _title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
        _choice1: "I love Elton John! Hand him the cassette tape.", _choice1Destination: 5,
        _choice2: "It's him or me! You take the knife and stab him.", _choice2Destination: 4
    ),
    Story(
        _title: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
        _choice1: "The", _choice1Destination: 0,
        _choice2: "End", _choice2Destination: 0
    ),
    Story(
        _title: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
        _choice1: "The", _choice1Destination: 0,
        _choice2: "End", _choice2Destination: 0
    ),
    Story(
        _title: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'",
        _choice1: "The", _choice1Destination: 0,
        _choice2: "End", _choice2Destination: 0
    )
]
    mutating func setDestiny(_ choiceText: String){
        if(choiceText == Storys[currentStory].choice1){
            currentStory = Storys[currentStory].choice1Destination
        }
        else{
            currentStory = Storys[currentStory].choice2Destination
        }      
    }
    
}
