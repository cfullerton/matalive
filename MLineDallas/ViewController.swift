//
//  ViewController.swift
//  MLineDallas
//
//  Created by Conner Fullerton on 12/11/16.
//  Copyright © 2016 Conner Fullerton. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //after view loads
        mapView.delegate = self;
        mapView.isUserInteractionEnabled = false;
        let initialLocation = CLLocation(latitude:32.793,longitude:-96.801);
        centerMapOnLocation(location: initialLocation);
        getTrollyLocations()
    }
    func getTrollyLocations(){
       /* var request = URLRequest(url: URL(string: "http://track.mata.org:7170/allCars")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, err in
          
            }.resume()
       */
        
        let urlString = "http://track.mata.org:7170/allCars"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                    
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
    }
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 3.0, regionRadius * 3.0)
        mapView.setRegion(coordinateRegion, animated: true)
        let locations = [CLLocation( latitude:32.801866,longitude:-96.800921),
                         CLLocation( latitude:32.807605,longitude:-96.797218),
                         CLLocation( latitude:32.807928,longitude:-96.796825),
                         CLLocation(latitude:32.80555,longitude:-96.79408700000002),
                         CLLocation( latitude:32.80558,longitude:-96.79405200000001),
                         CLLocation( latitude:32.807965,longitude:-96.796784),
                         CLLocation( latitude:32.808701,longitude:-96.79587),
                         CLLocation( latitude:32.809536,longitude:-96.796814),
                         CLLocation( latitude:32.807955,longitude:-96.798829),
                         CLLocation( latitude:32.8071,longitude:-96.799828),
                         CLLocation( latitude:32.806619,longitude:-96.799275),
                         CLLocation( latitude:32.805047,longitude:-96.80029),
                         CLLocation( latitude:32.803497,longitude:-96.801327),
                         CLLocation( latitude:32.802399,longitude:-96.802053),
                         CLLocation( latitude:32.801826,longitude:-96.802391),
                         CLLocation( latitude:32.800724,longitude:-96.801144),
                         CLLocation( latitude:32.800448,longitude:-96.80093),
                         CLLocation( latitude:32.800163,longitude:-96.800837),
                         CLLocation( latitude:32.799744,longitude:-96.800919),
                         CLLocation( latitude:32.797646,longitude:-96.801428),
                         CLLocation( latitude:32.795088,longitude:-96.802172),
                         CLLocation( latitude:32.792926,longitude:-96.80288800000001),
                         CLLocation( latitude:32.791663,longitude:-96.803337),
                         CLLocation( latitude:32.789312,longitude:-96.804016),
                         CLLocation( latitude:32.788596,longitude:-96.80315200000001),
                         CLLocation( latitude:32.788087,longitude:-96.802504),
                         CLLocation( latitude:32.78612,longitude:-96.800205),
                         CLLocation( latitude:32.784398,longitude:-96.798264),
                         CLLocation( latitude:32.784347,longitude:-96.798114),
                         CLLocation( latitude:32.784379,longitude:-96.797961),
                         CLLocation( latitude:32.784431,longitude:-96.797831),
                         CLLocation( latitude:32.784518,longitude:-96.797697),
                         CLLocation( latitude:32.785051,longitude:-96.797057),
                         CLLocation( latitude:32.785577,longitude:-96.79669500000001),
                         CLLocation( latitude:32.78566200000001,longitude:-96.796515),
                         CLLocation(latitude:32.785738,longitude:-96.796344),
                         CLLocation(latitude:32.785849,longitude:-96.79626300000001),
                         CLLocation( latitude:32.785965,longitude:-96.796281),
                         CLLocation( latitude:32.786035,longitude:-96.796364),
                         CLLocation( latitude:32.786139,longitude:-96.796555),
                         CLLocation( latitude:32.786868,longitude:-96.797337),
                         CLLocation( latitude:32.787655,longitude:-96.798363),
                         CLLocation( latitude:32.787863,longitude:-96.798653),
                         CLLocation( latitude:32.788047000000006,longitude:-96.79893900000002),
                         CLLocation( latitude:32.788266,longitude:-96.799532),
                         CLLocation( latitude:32.788431,longitude:-96.799783),
                         CLLocation( latitude:32.788918,longitude:-96.800427),
                         CLLocation( latitude:32.789342,longitude:-96.800946),
                         CLLocation( latitude:32.789875,longitude:-96.80152),
                         CLLocation( latitude:32.791487,longitude:-96.803248),
                         CLLocation( latitude:32.791631,longitude:-96.803289),
                         CLLocation( latitude:32.792908,longitude:-96.802836),
                         CLLocation( latitude:32.79508,longitude:-96.802138),
                         CLLocation( latitude:32.79764,longitude:-96.801398),
                         CLLocation( latitude:32.799732,longitude:-96.800865),
            CLLocation(latitude:32.80024,longitude:-96.800755),
            CLLocation( latitude:32.801715,longitude:-96.800966),
            CLLocation( latitude:32.801808,longitude:-96.80095),
            CLLocation(latitude:32.801866,longitude:-96.800921)]
        var coordinates = locations.map({(location: CLLocation!) -> CLLocationCoordinate2D in return location.coordinate})
        let polyline = MKPolyline(coordinates: &coordinates, count: locations.count)
        mapView.add(polyline);
    
        
    }
    func mapView(_ mapView: MKMapView!, rendererFor overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blue;
            polylineRenderer.lineWidth = 5
            return polylineRenderer
        }
        
        return nil
    }
    
   }

