//
//  DataModel.swift
//  IEPAM-App
//
//  Created by Sergio on 10/10/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class DataModel: ObservableObject {
    @Published var dimensions = [Dimension]()
    @Published var tests = [Test]()
    @Published var testsFiltered = [Test]()
    @Published var answers = [Answer]()
    @Published var answersFiltered = [Answer]()
    @Published var questions = [Question]()
    @Published var questionsFiltered = [Question]()
    @Published var currentPam = PAM.emptyPAM
    @Published var testRange = [TestRange]()
    @Published var recordatorios = [Recomendacion]()
    @Published var recordatoriosFiltered = [Recomendacion]()
    @Published var recomendaciones = [Recomendacion]()
    
    init(){
        print("init")
        loadDimensions()
        loadTests()
        loadAnswers()
        loadQuestions()
        loadTestRange()
        loadRecordatorios()
        loadRecomendaciones()
    }
    
    
    func loadDimensions() {
        print("load")
        dimensions.removeAll()
        
        let URL = "http://localhost:3000/dimensions"
//        print(URL)
        AF.request(URL, method: .get)
        
            .responseData { data in
                if let responseCode = data.response?.statusCode {
                    if responseCode == 200 {
                        let json = try! JSON(data: data.data!)
//                        print(json)
                        
                        var dimension: Dimension
                        
                        for m in json {
                            dimension = Dimension(id: m.1["dimension_id"].intValue,
                                                  dimension: m.1["dimension"].stringValue)
                            self.dimensions.append(dimension)
                            
                        }
                    }
                }
                
            }
        
    }
    func loadTests() {
        
        tests.removeAll()
        testsFiltered.removeAll()
        
        let URL = "http://localhost:3000/tests"
        
        AF.request(URL, method: .get)
        
            .responseData { data in
                if let responseCode = data.response?.statusCode {
                    if responseCode == 200 {
                        let json = try! JSON(data: data.data!)
//                                                print(json)
                        
                        var test: Test
                        
                        for t in json {
                            test = Test(
                                id: t.1["test_id"].intValue,
                                test: t.1["test"].stringValue,
                                dimension_id: t.1["dimension_id"].intValue,
                                self_test: t.1["self_test"].boolValue,
                                result: 0,
                                index: t.1["index"].floatValue,
                                total: t.1["total"].floatValue
                            )
                            self.tests.append(test)
                            
                        }
                    }
                }
                
            }
        
    }
    
    func loadQuestions() {
        
        questions.removeAll()
        questionsFiltered.removeAll()
        
        let URL = "http://localhost:3000/questions"
        
        AF.request(URL, method: .get)
        
            .responseData { data in
                if let responseCode = data.response?.statusCode {
                    if responseCode == 200 {
                        let json = try! JSON(data: data.data!)
//                                                print(json)
                        
                        var question: Question
                        
                        for q in json {
                            question = Question(
                                id: q.1["question_id"].intValue,
                                question: q.1["question"].stringValue,
                                test_id: q.1["test_id"].intValue,
                                answer_id: 0
                            )
                            self.questions.append(question)
                            
                        }
                    }
                }
                
            }
        
    }
    
    
    func loadAnswers() {
        
        answers.removeAll()
        answersFiltered.removeAll()
        
        let URL = "http://localhost:3000/answers"
        
        AF.request(URL, method: .get)
        
            .responseData { data in
                if let responseCode = data.response?.statusCode {
                    if responseCode == 200 {
                        let json = try! JSON(data: data.data!)
//                                                print(json)
                        
                        var answer: Answer
                        
                        for a in json {
                            answer = Answer(
                                id: a.1["answer_id"].intValue,
                                answer: a.1["answer"].stringValue,
                                weight: a.1["weight"].floatValue,
                                question_id: a.1["question_id"].intValue
                            )
                            self.answers.append(answer)
                            
                        }
                    }
                }
                
            }
        
    }
    
//    func loadPam(id: Int) {
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//
//        let URL = "http://localhost:3000/api/getPam/\(id)"
//
//        AF.request(URL, method: .get)
//
//            .responseData { data in
//                if let responseCode = data.response?.statusCode {
//                    if responseCode == 200 {
//                        let json = try! JSON(data: data.data!)
//
//                        var pam: PAM
//
//                        for p in json {
//                            print(p.1["name"].stringValue)
//                            pam = PAM(
//                                id: p.1["id"].intValue,
//                                name: p.1["name"].stringValue,
//                                gender_id: p.1["gender_id"].intValue,
//                                gender: p.1["gender"].stringValue,
//                                birth_date: formatter.date(from: p.1["birth_date"].stringValue)!,
//                                height: p.1["height"].floatValue,
//                                weight: p.1["weight"].floatValue,
//                                blood_type: p.1["blood_type"].stringValue,
//                                chapel_id: p.1["chapel_id"].intValue,
//                                chapel: p.1["chapel"].stringValue,
//                                church_id: p.1["church_id"].intValue,
//                                church: p.1["church"].stringValue,
//                                deanship_id: p.1["deanship_id"].intValue,
//                                deanship: p.1["deanship"].stringValue,
//                                zone_id: p.1["zone_id"].intValue,
//                                zone: p.1["zone"].stringValue,
//                                city_id: p.1["gender_id"].intValue,
//                                city: p.1["city"].stringValue,
//                                state_id: p.1["state_id"].intValue,
//                                state: p.1["state"].stringValue,
//                                state_code: p.1["state_code"].stringValue,
//                                zip_code: p.1["gender"].stringValue,
//                                suburb: p.1["suburb"].stringValue)
//
//                            self.currentPam = pam
//                        }
//
//                    }
//                }
//
//            }
//
//    }
    
    func loadTestRange() {

        testRange.removeAll()

        let URL = "http://localhost:3000/testsrange"

        AF.request(URL, method: .get)

            .responseData { data in
                if let responseCode = data.response?.statusCode {
                    if responseCode == 200 {
                        let json = try! JSON(data: data.data!)
                        //                        print(json)

                        var testRange: TestRange

                        for t in json {
                            testRange = TestRange(
                                id: t.1["test_range_id"].intValue,
                                lower_value: t.1["lower_value"].intValue,
                                upper_value: t.1["upper_value"].intValue,
                                test_id: t.1["test_id"].intValue,
                                indicator: t.1["indicator"].stringValue,
                                color: t.1["color"].stringValue)

                            self.testRange.append(testRange)

                        }
                    }
                }

            }

    }
    
    func loadRecordatorios(){
        recordatorios.removeAll()
        var recordatorio : Recomendacion
        
        recordatorio = Recomendacion(id: 0, test_id: 0, titulo: "Tomar la prueba Deyesavage", body: "Recuerda hacer la prueba de Escala Abreviada de Depresión desde la app.", fecha: "20/10/2022")
        recordatorios.append(recordatorio)
        
        recordatorio = Recomendacion(id: 1, test_id: 1, titulo: "Tomar la prueba FRAIL", body: "Recuerda hacer la prueba para el diagnóstico de la fragilidad", fecha: "20/10/2022")
        recordatorios.append(recordatorio)
        
        recordatorio = Recomendacion(id: 2, test_id: 2, titulo: "Tomar la prueba KATZ", body: "Recuerda hacer la prueba para el índice de KATZ", fecha: "20/10/2022")
        recordatorios.append(recordatorio)
        
        recordatorio = Recomendacion(id: 3, test_id: 3, titulo: "Tomar la prueba Gijón", body: "Recuerda hacer la prueba de la escala sociofamiliar Gijón", fecha: "20/10/2022")
        recordatorios.append(recordatorio)
        
    }
    
    func loadRecomendaciones(){
        recomendaciones.removeAll()
        var recomendacion: Recomendacion
        
        recomendacion = Recomendacion(id: 0, test_id: 0, titulo: "Sopa de letras", body: "Prueba el juego de sopa de letras para mantenerte activo.",fecha: "sopa")
        recomendaciones.append(recomendacion)
        
        recomendacion = Recomendacion(id: 1,test_id: 0, titulo: "Memorama", body: "Prueba el juego de memorama para pasar un buen rato.",fecha: "memorama")
        recomendaciones.append(recomendacion)
        
        recomendacion = Recomendacion(id: 2,test_id: 0, titulo: "Leer", body: "Leer activa la inspiración, imaginación y el surgimiento de ideas.",fecha: "")
        recomendaciones.append(recomendacion)
        
    }
}


