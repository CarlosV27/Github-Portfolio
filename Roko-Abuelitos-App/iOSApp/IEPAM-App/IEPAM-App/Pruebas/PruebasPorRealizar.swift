//
//  PruebasPorRealizar.swift
//  IEPAM-App
//
//  Created by Sergio on 06/10/22.
//

import SwiftUI

struct PruebasPorRealizar: View {
    @ObservedObject var dataModel: DataModel
    var dimension: Dimension
    
    var body: some View {
            ZStack {
                Color("azulSecundario")
                //                .edgesIgnoringSafeArea(.top)
                    .ignoresSafeArea()
                VStack(spacing:0){
                    Image("caminata")
                        .resizable()
                        .scaledToFit()
                    //                    .cornerRadius(radius: 20.0, corners: [.topLeft, .topRight])
                        .cornerRadius(20)
                    //                    .ignoresSafeArea()
                    RoundedRectangle(cornerRadius: 0)
                        .fill(.clear)
                        .overlay(content: {
                            VStack(){
                                Text(dimension.dimension)
                                    .font(.custom("Recoleta-Bold", size: 30))
                                    .frame(width: 400, height: 80)
                                
                                    .background(.white)
                                    .background(Color("azulSecundario"))
                                VStack(alignment: .leading){
                                    Spacer()
                                    ForEach(dataModel.testsFiltered){test in
//                                        Actualizar preguntaIndex
                                        HStack{
                                            VStack{
                                                NavigationLink(destination: Deyesavage(dataModel: dataModel, test: test, question: Question.dummy, valor: 0)){
                                                    Text(test.test)
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 20, weight: .semibold))
                                                        .frame(maxWidth: 300, alignment: .leading)
                                                    
                                                }
                                                
                                                ProgressView(value: Double(test.index/test.total))
                                                    .tint(Color("rojo"))
                                            }
                                            Circle()
                                                .fill(Color(getColorIndicador(test: test)))
                                                .frame(height: 35)
                                            
                                            
//                                            ForEach(dataModel.testRange){range in
//                                                if(test.id == range.test_id){
//                                                    Circle()
//                                                        .fill(Color(range.color))
//                                                        .frame(height:35)
//                                                }
//                                            }
                                            
                                        }
                                        .frame(width: 340)
                                        
                                        Spacer()
                                    }
//                                    Circle()
//                                        .fill(Color("gray"))
//                                        .frame(height:35)

                                        
                                }
                                .frame(width:400)
                                .background(Color("azulSecundario"))
                                
                                
                            }
                            .cornerRadius(20)
                            .offset(y:-30)
                            //                        .frame(width: 0)
                        })
                }
            }
            
            .onAppear(){
                dataModel.testsFiltered.removeAll()
                dataModel.testsFiltered = dataModel.tests.filter { test in
                    print(test.index == test.total)
                    return test.dimension_id == dimension.id
                }
                
                
                print("Completed")
            }
        }
    func getColorIndicador(test: Test) -> String {
        if(test.index == test.total){
            if let index = dataModel.testRange.firstIndex(where: { test.result >= $0.lower_value && test.result <= $0.upper_value && $0.test_id == test.id }) {
                print("Color",dataModel.testRange[index].color)
                print(index)
                return dataModel.testRange[index].color
            } else {
                print(index)
                return "gray"
            }
        }else{
            return "gray"
        }
        
    }
}

//step 1 -- Create a shape view which can give shape
struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//step 2 - embed shape in viewModifier to help use with ease
struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
//step 3 - crate a polymorphic view with same name as swiftUI's cornerRadius
extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct PruebasPorRealizar_Previews: PreviewProvider {
    static var previews: some View {
        PruebasPorRealizar(dataModel: DataModel(), dimension: Dimension.dummy)
    }
}
