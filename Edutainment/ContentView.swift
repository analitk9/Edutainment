//
//  ContentView.swift
//  Edutainment
//
//  Created by Denis Evdokimov on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var multipl: Int  =  2
    @State private var amount: Int = 1
    private let amountQuestions: [Int] = [5, 10, 20]
    @State private var questions = Questions()
    @State private var answers: Answers = .init()
    @State private var isGameOn = false
    @State private var showSettings = false
    @State private var answerString: String = ""
    
    @State var currentquestion = 0
    @FocusState var isFocus: Bool
    private  func commitAnswer() {
        let curQustion = questions.questions[currentquestion]
        answers.addNewAnswer(question: curQustion, answer: Int(answerString)!)
        answerString = ""
        currentquestion += 1
        if currentquestion == amountQuestions[amount] {
            isGameOn = false
            clearQuestions()
        } else {
            isFocus = true
        }
    }
    
   
    var body: some View {
        if isGameOn {
            VStack {
                Text("\(questions.questions[currentquestion].question)")
                TextField("Ваш ответ", text: $answerString)
                    .keyboardType(.numberPad)
                    .focused($isFocus)
                Button("Ввод") {
                  
                    commitAnswer()
                    
                }
                List(answers.arr) { answ in
                    HStack {
                        Text(answ.question.question)
                        Text("\(answ.answer)")
                            .foregroundStyle(answ.isRight ? .green : .red)
                    }
                }
            }
        } else {
            VStack {
                Button(action: {
                    isFocus = true
                    isGameOn.toggle()}) {
                    Text("Играть                     ")
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .controlSize(.large)
                .disabled(questions.questions.isEmpty)
                
                Button(action: {showSettings.toggle()}) {
                    Image(systemName: "gear")
                    Text("Настройка")
                        .padding(.horizontal)
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .controlSize(.large)
                
            }
            .padding()
            .sheet(isPresented: $showSettings) {
                VStack(alignment: .leading){
                    Stepper("Таблица умножения на : \(multipl)", value: $multipl, in: 2...9)
                    Text("До скольки умножаем")
                    Picker("", selection: $amount) {
                        
                        ForEach(0..<amountQuestions.count, id: \.self){
                            Text("\(amountQuestions[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    HStack {
                        Button(action: {clearQuestions()}) {
                            Image(systemName: "eraser")
                            Text("Очистить")
                                .padding(.horizontal)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        .controlSize(.large)
                        
                        Button(action: {makeQuestion()}) {
                            Image(systemName: "pencil")
                            Text("Создать")
                                .padding(.horizontal)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .controlSize(.large)
                    }
                }
            }
        }
        }
    
    
    func makeQuestion() {
        
        (1...amountQuestions[amount]).forEach{ num in
            
            questions.createQuestions(multiplication: multipl, amount: num)
        }
        questions.questions.shuffle()
        showSettings.toggle()
    }
    
    func clearQuestions(){
        questions.questions.removeAll()
    }
}

#Preview {
    ContentView()
}
