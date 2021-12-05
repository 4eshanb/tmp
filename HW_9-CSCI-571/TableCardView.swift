//
//  TableCardView.swift
//  HW_9-CSCI-571
//
//  Created by Eshan Bhargava on 12/4/21.
//

import SwiftUI

struct TableCardView: View {
    var item: AutoLocateResponse
    var body: some View {
        HStack(spacing: 15){
            Text(item.date)
            Image("Mostly Clear")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 40)
            Text(item.sunRiseTime)
            Image("sun-rise")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 40)
            Text(item.sunSetTime)
            Image("sun-set")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 40)
        }
    }
}

struct TableCardView_Previews: PreviewProvider {
    static var previews: some View {
        TableCardView(item: AutoLocateResponse(id: 1, date: "10/22/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"))
    }
}
