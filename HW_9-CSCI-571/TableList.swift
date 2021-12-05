//
//  TableList.swift
//  HW_9-CSCI-571
//
//  Created by Eshan Bhargava on 12/4/21.
//

import SwiftUI

struct TableList: View {
    var daysToPut: [AutoLocateResponse]
    var body: some View {
        List(daysToPut) {
            day in ListRow(dayInfo: day)
        }
    }
}

struct ListRow: View {
    var dayInfo: AutoLocateResponse
    var body: some View {
        Group() {
            HStack{
                Text(dayInfo.date)
                Spacer()
                Image("Mostly Clear")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 40)
            }
        }
    }
}

var days = [
    AutoLocateResponse(id: 1, date: "10/22/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
    AutoLocateResponse(id: 2, date: "10/23/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
    AutoLocateResponse(id: 3, date: "10/24/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
    AutoLocateResponse(id: 4, date: "10/25/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
    AutoLocateResponse(id: 5, date: "10/26/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
    AutoLocateResponse(id: 4, date: "10/27/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
    AutoLocateResponse(id: 5, date: "10/28/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00")
]

struct TableList_Previews: PreviewProvider {
    static var previews: some View {
        TableList(daysToPut: days)
    }
}

extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "MM/dd/yyyy"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}
