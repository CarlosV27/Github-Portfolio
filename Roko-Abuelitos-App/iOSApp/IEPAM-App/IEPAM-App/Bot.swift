//
//  Bot.swift
//  IEPAM-App
//
//  Created by Sergio on 20/10/22.
//

import SwiftUI

struct Bot: View {
    var img = ""
    var body: some View {
        ZStack{
            Color.black
            VStack{
                            Image(img)
                                .resizable()
                                .scaledToFit()
            }
            .onAppear{
                print(img)
            }
        }
//        .background(
//            .black
//        )
    }
}

struct Bot_Previews: PreviewProvider {
    static var previews: some View {
        Bot(img: "")
    }
}
