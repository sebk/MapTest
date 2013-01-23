//
//  ViewController.m
//  MapTest
//
//  Created by Sebastian Kruschwitz on 23.01.13.
//  Copyright (c) 2013 Gobas. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "MapAnnotation.h"

@interface ViewController ()

@property(nonatomic, strong) UIPopoverController *popView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_mapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake(51.151786, 0.415039), MKCoordinateSpanMake(4.05843f,9.09668f))];
    
    MapAnnotation *anno = [[MapAnnotation alloc] init];
    //anno.title = @"Test";
    anno.coordinate = CLLocationCoordinate2DMake(51.151786, 0.415039);
    
    [_mapView addAnnotation:anno];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)aView {
    
    if (UIUserInterfaceIdiomPhone == UI_USER_INTERFACE_IDIOM()) {
        return; 
    }
    
        
    NSLog(@"DID SELECT");

    
    //Popover isn't correct...may see here http://stackoverflow.com/questions/2763284/placing-arrow-of-uipopovercontroller-at-annotation-point-on-mapkit for a hint
    
    DetailViewController *popUp=[[DetailViewController alloc] initWithNibName:@"DetailViewController_iPad" bundle:nil];
    
    _popView = [[UIPopoverController alloc]initWithContentViewController:popUp];
    
    //popView.delegate =self;
    
    [_popView setPopoverContentSize:CGSizeMake(400, 300)];
    
    //AnnotationImageView *myLocationImage = (AnnotationImageView *)view;
    //popUp.locationID = myLocationImage.locationID;
    
    [_popView presentPopoverFromRect:aView.bounds inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
    
}

@end
