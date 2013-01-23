//
//  ViewController.h
//  MapTest
//
//  Created by Sebastian Kruschwitz on 23.01.13.
//  Copyright (c) 2013 Gobas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property(nonatomic, weak) IBOutlet MKMapView *mapView;

@end
