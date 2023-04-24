//
//  MapView.swift
//  Week9-3_MapUIKit
//
//  Created by David Zhang on 10/21/22.
//

import SwiftUI

import MapKit

struct MyView : UIViewRepresentable{
    @EnvironmentObject var VM: ViewModel
    var cap = CountryCapital()
    
    @Binding var showWeb : Bool
    
//    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: cap.capital_latitude, longitude: cap.capital_longitude), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    
    var region : MKCoordinateRegion{
        get{
            var temp = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: cap.capital_latitude, longitude: cap.capital_longitude), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
            return temp
        }
    }
    
    var point_of_interest: [MKPointAnnotation] {
        
        var locs = [MKPointAnnotation]()
        var loc = MKPointAnnotation()
        loc.coordinate = CLLocationCoordinate2D(latitude: region.center.latitude, longitude: region.center.longitude)
        loc.title = cap.capital_name
        
        locs.append(loc)
        
        return locs
    }
    
    // create
    func makeUIView(context: Context) -> MKMapView {
        // return MKMapView()
        var map = MKMapView()
        // map.addAnnotations(point_of_interest)
        map.delegate = context.coordinator
        return map
    }
    
    // update
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(point_of_interest)
        uiView.setRegion(region, animated: true)
    }
    
    // tear down
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
    // return the delegate
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self, cap: cap)
    }
    
    
    // delegate
    class Coordinator : NSObject, MKMapViewDelegate{
        var cap : CountryCapital
        var map : MyView
        
        init(map: MyView, cap: CountryCapital){
            self.map = map
            self.cap = cap
        }
        
        // how the annotation is displayed
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
            
            annotationView.canShowCallout = true
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            return annotationView
            
        }
        
        // how to respond
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            if view.annotation?.title == cap.capital_name{
                print(cap.capital_name)
                map.showWeb = true
            }
            print(cap.capital_name)
            print(view.annotation?.title)
        }
        
        
        
    }
    
}

struct MapView: View {
    @EnvironmentObject var VM: ViewModel
    var cap = CountryCapital()
    
    @Binding var showWeb : Bool
    
    var body: some View {
        MyView(cap: cap, showWeb: $showWeb)
            .environmentObject(ViewModel())
            .sheet(isPresented: $showWeb) {
                CapitalView(cap: cap)
            }
            
    }
}

