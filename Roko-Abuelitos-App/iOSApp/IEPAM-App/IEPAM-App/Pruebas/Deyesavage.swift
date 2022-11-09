//
//  Deyesavage.swift
//  IEPAM-App
//
//  Created by Sergio on 06/10/22.
//

import SwiftUI

struct Deyesavage: View {
    @ObservedObject var dataModel: DataModel
    @ObservedObject var test: Test
    @State var question: Question
    @State var valor: Float
    
    var body: some View {
        
        ZStack{
            Color("azulSecundario")
                .ignoresSafeArea()
            VStack{
                Text(test.test)
                    .font(.system(size: 25, weight: .semibold))
                Spacer()
                    .frame(maxHeight: 50)
                ProgressView(value: Double(test.index/test.total))
                    .background(.white)
                    .frame(width: 300, height: 30)
                    .progressViewStyle(RoundedRectProgressViewStyle())
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                
                Spacer()
                if(test.index == test.total){
                
                    Resultado(dataModel: dataModel, test: test)
                    
                }else{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(width: 350, height: 350)
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                    
                        .overlay(content: {
                            VStack {
                                ForEach(Array(dataModel.questionsFiltered.enumerated()) , id: \.1.question) { (index, questionFor) in
                                    if(Int(test.index) == index){
                                        
                                        Text(questionFor.question)
                                            .font(.system(size: 24))
                                            .fixedSize(horizontal: false, vertical: true)
                                            .onAppear{
                                                question = questionFor
                                                print("On appear quest")
                                                dataModel.answersFiltered.removeAll()
                                                dataModel.answersFiltered = dataModel.answers.filter { answer in
                                                    if (answer.question_id == question.id){
                                                        print("filter")
                                                    }
                                                    return answer.question_id == question.id
                                                }
                                            }
                                    }
                                }
                                
                                Spacer()
                                ForEach(Array(dataModel.answersFiltered.enumerated()),id: \.1.answer) { (index, answer) in
                                    
                                    BotonRespuesta(test: test, question: question, answer: answer)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    Spacer()
                                    
                                }
                                
                                
                            }.frame(height: 250)
                            
                        })
                    Spacer()
                    Button {
//                        print("Continuar",test.index, dataModel.questionsFiltered[Int(test.index)].question)
//                        print("Progress", Double(test.index/test.total))
                        test.index = test.index+1

                        dataModel.answersFiltered.removeAll()
                        dataModel.answersFiltered = dataModel.answers.filter { answer in
                            return answer.question_id == question.id
                        }
                        print( dataModel.answersFiltered )
                        
                        
                    } label: {
                        Text("Continuar")
                            .font(.custom("Inter-Regular", size: 20))
                            .foregroundColor(.black)
                            .padding()
                        
                    }
                    .frame(width: 130)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                }
                Spacer()
//                    .frame(height: 100)
            }
            
        }
        .onAppear{
            dataModel.questionsFiltered.removeAll()
            dataModel.questionsFiltered = dataModel.questions.filter { question in
                return question.test_id == test.id
            }
            dataModel.answersFiltered.removeAll()
            dataModel.answersFiltered = dataModel.answers.filter { answer in
                if (answer.question_id == question.id){
                    print( answer.question_id)
                }
                return answer.question_id == question.id
            }
            
            print( dataModel.answersFiltered)
        }
        
        
    }
    
    func printNumber(number: Float) {
        print("Progress", number)
    }
    

}

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 285, height: 20)
                .foregroundColor(.white)
            
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 285, height: 20)
                .foregroundColor(.green)
        }
        .padding()
        .padding(sides: [.left], value: 0)
    }
}

enum Side: Equatable, Hashable {
    case left
    case right
}


extension View {
    func padding(sides: [Side], value: CGFloat = 8) -> some View {
        HStack(spacing: 0) {
            if sides.contains(.left) {
                Spacer().frame(width: value)
            }
            self
            if sides.contains(.right) {
                Spacer().frame(width: value)
            }
        }
    }
    
    
}


struct Deyesavage_Previews: PreviewProvider {
    static var previews: some View {
        Deyesavage(dataModel: DataModel(), test: Test(id:0, test: "", dimension_id: 0, self_test: false, result: 0, index: 0, total: 5), question: Question.dummy, valor: 0)
    }
}

struct BotonRespuesta: View{
    @ObservedObject var test : Test
    @ObservedObject var question: Question
    @State var answer: Answer
    
    var body: some View{
        Button {
            question.answer_id = answer.id
            print("question",question.answer_id)

            test.result = test.result + Int(answer.weight)
            print("test:",test.result, "| testTotal:", test.total)
        } label: {
            Text(answer.answer)
                .font(.custom("Inter-Regular", size: 20))
                .foregroundColor(.white)
                .frame(width: 300)
                .frame(minHeight: 30)
                .background(question.answer_id == answer.id ? Color("azulPrimario"):Color("unselect"))
            
        }
    }
    
}

struct BotonRespuesta_Previews: PreviewProvider {
    static var previews: some View {
        BotonRespuesta(test: Test(id: 0, test: "", dimension_id: 0, self_test: true, result: 0, index: 0, total: 0), question: Question.dummy, answer: Answer(id: 0, answer: "", weight: 0, question_id: 0))
    }
}
