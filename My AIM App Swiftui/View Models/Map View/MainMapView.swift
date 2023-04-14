//
//  MainMapView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 14/04/2023.
//

import SwiftUI
import MapKit

struct MainMapView: View {
    @State private var searchText: String = ""
    @State private var annotations: [MKAnnotation] = []
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                searchLocation()
            }) {
                Text("Search")
            }
            
            MapView(annotations: annotations)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    private func searchLocation() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchText) { (placemarks, error) in
            if let error = error {
                print("Error geocoding address: \(error.localizedDescription)")
                return
            }
            
            if let placemarks = placemarks {
                annotations = placemarks.map { placemark in
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = placemark.location!.coordinate
                    annotation.title = placemark.name
                    return annotation
                }
            }
        }
    }
}

struct MainMapView_Previews: PreviewProvider {
    static var previews: some View {
        MainMapView()
    }
}



struct MapView: UIViewRepresentable {
    var annotations: [MKAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)
        
        if !annotations.isEmpty {
            let region = MKCoordinateRegion(
                center: annotations[0].coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            uiView.setRegion(region, animated: true)
        }
    }
}
