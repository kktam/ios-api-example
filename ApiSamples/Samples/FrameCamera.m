#import "FrameCamera.h"
@import Wrld;


@interface FrameCamera () <WRLDMapViewDelegate>

@property (nonatomic) WRLDMapView *mapView;

@end

@implementation FrameCamera

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mapView = [[WRLDMapView alloc] initWithFrame:self.view.bounds];
    
    _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _mapView.delegate = self;
    
    [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(37.7858, -122.401)
                        zoomLevel:15
                         animated:NO];
    
    [self.view addSubview:_mapView];
}

// wait for map to load before positioning the map to frame a specified area
- (void)mapViewDidFinishLoadingInitialMap:(WRLDMapView *)mapView
{
    WRLDCoordinateBounds bounds = WRLDCoordinateBoundsMake(CLLocationCoordinate2DMake(37.786647, -122.407015), CLLocationCoordinate2DMake(37.798886, -122.395116));
    [_mapView setCoordinateBounds:bounds animated:YES];
}

@end
