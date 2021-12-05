//
//  ContentView.swift
//  HW_9-CSCI-571
//
//  Created by Eshan Bhargava on 11/20/21.
//

import SwiftUI
import Highcharts
import SwiftyJSON
import Toast_Swift
import SwiftSpinner
import Alamofire
import CoreLocation

struct ContentView: View {
    @State private var searchText = ""
    
    //@StateObject var locationManager = LocationManager()
    @StateObject var locationManager = LocationManager()
    @State var lat = 34.0224
    //@State var lat = 0.1
    @State var lng = 118.2851
    
    
    
    var days = [
        AutoLocateResponse(id: 1, date: "10/22/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
        AutoLocateResponse(id: 2, date: "10/23/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
        AutoLocateResponse(id: 3, date: "10/24/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
        AutoLocateResponse(id: 4, date: "10/25/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
        AutoLocateResponse(id: 5, date: "10/26/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
        AutoLocateResponse(id: 4, date: "10/27/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00"),
        AutoLocateResponse(id: 5, date: "10/28/1999", weatherCode: 1000, sunRiseTime: "7:00", sunSetTime: "8:00")
    ]

   
    var body: some View {
        //Text("longitude: \(userLongitude)")
        // Text("latitude: \(userLatitude)")
        //NavigationView {
            VStack{
                //Text("latitude: \(lat)").background()
                
                // CurrLocationView().background()
                //CurrLocationView().environmentObject(locationManager)
                //Spacer()
                SearchBar(text: $searchText)
                Spacer()
                
                Group() {
                    HStack{
                        Spacer()
                        Image("Mostly Clear")
                        Spacer()
                        VStack(alignment: .leading) {
                            Spacer()
                            Text("84°F").font(.largeTitle)
                            Spacer()
                            Text("Clear").font(.title3)
                            Spacer()
                            Text("Los Angeles").font(.title2)
                            Spacer()
                        }
                        Spacer()
                    }
                }.frame(width: 350, height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                    .background(Color.white.opacity(0.2))
                        
                
                Spacer()
                Group{
                    HStack{
                        VStack {
                            Text("Humidity")
                            Image("Humidity")
                            Text("32.0 %")
                        }
                        VStack {
                            Text("Wind Speed")
                            Image("WindSpeed")
                            Text("0.29 mph")
                        }
                        VStack {
                            Text("Visibility")
                            Image("Visibility")
                            Text("9.94 mi")
                        }
                        VStack {
                            Text("Pressure")
                            Image("Pressure")
                            Text("29.85 inHg")
                        }
                        
                    }
                }
                Spacer()
                
                ScrollView(.vertical, showsIndicators: false){
                    Group{
                        VStack() {
                        ForEach(days) {item in
                            TableCardView(item: item)
                            Divider()
                        }
                    }
                    }.background(Color.white.opacity(0.4))
                }
                .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.white, lineWidth: 2))
                .frame(width: 370, height: 280)
                
                Spacer()
                
               
                
            }.background(Image("App_background")
                            .scaledToFill()
                            .clipped())
                //.position(x: 20, y: 900))
                //.edgesIgnoringSafeArea(.top)
                //.statusBar(hidden: false)
            .onAppear(perform: { locationManager.requestLocation()
                let location = locationManager.location
                lat = Double(location?.latitude ?? 34.0224)
                lng = Double(location?.longitude ?? 118.2851)
                
            })
        
        //}
    }

}



struct SearchBar: UIViewRepresentable {
    
    // binds text, from search bar,
    // to pass to any view
    @Binding var text:String
    
    // coordinator
    class Coordinator: NSObject, UISearchBarDelegate  {
        @Binding var text:String
        
        init(_ text: Binding<String>){
            _text = text
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            print("the text changed to", searchText)
        }
        
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        // need to set the delegate to a coordinator
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    // what happens when we want to update this view?
    // we update the text
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text;
    }
    
    // allow us to configure those delegate methods for when the
    // text changes
    func makeCoordinator() -> Coordinator {
        // dollar sign is for binded values
        return Coordinator($text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        /*.previewInterfaceOrientation(.portraitUpsideDown)
         }*/
    }
}
