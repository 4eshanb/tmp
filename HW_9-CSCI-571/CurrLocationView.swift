//
//  CurrLocationView.swift
//  HW_9-CSCI-571
//
//  Created by Eshan Bhargava on 12/4/21.
//

import SwiftUI
import CoreLocationUI

struct CurrLocationView: View {
    
    @EnvironmentObject var locationManager : LocationManager
    
    init() {
        locationManager.requestLocation()
        /*var location = LocationManager.location
        var lat = location?.latitude
        var lng = location?.longitude*/
        
    }
    
    var userLatitude: String {
            return "\(locationManager.location?.latitude ?? 0)"
    }
        
    var userLongitude: String {
        return "\(locationManager.location?.longitude ?? 0)"
    }
    
    var body: some View {
        
        
        VStack {
            
            //Text("location status: \(currLocationManager.statusString)")
                
            Text("latitude: \(userLatitude)")
            Text("longitude: \(userLongitude)")
            
        }
    }
}

struct CurrLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrLocationView()
    }
}
