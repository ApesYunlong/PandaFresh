//
//  PositioningViewController.m
//  PandaFresh
//
//  Created by 李云龙 on 2018/2/5.
//  Copyright © 2018年 李云龙. All rights reserved.
//

#import "PositioningViewController.h"

#define DefaultLocationTimeout 100
#define DefaultReGeocodeTimeout 50

@interface PositioningViewController () <AMapLocationManagerDelegate, AMapGeoFenceManagerDelegate>

@property (nonatomic, strong) AMapLocationManager *locationManager;

@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;

@property (nonatomic, strong) UILabel *displayLabel;

@property (nonatomic, strong) AMapGeoFenceManager *geoFenceManager;


@end

@implementation PositioningViewController

- (void)dealloc
{
    
//    [self cleanUpAction];
//    self.completionBlock = nil;
    
    [self.geoFenceManager removeAllGeoFenceRegions];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self initCompleteBlock];
//
//    [self configLocationManager];
//
//    [self initDisplayLabel];

    //进行单次带逆地理定位请求 22.557292 114.125494
//    [self.locationManager requestLocationWithReGeocode:YES completionBlock:self.completionBlock];
    
    self.geoFenceManager = [[AMapGeoFenceManager alloc] init];
    self.geoFenceManager.delegate = self;
    self.geoFenceManager.activeAction = AMapGeoFenceActiveActionInside | AMapGeoFenceActiveActionOutside | AMapGeoFenceActiveActionStayed; //设置希望侦测的围栏触发行为，默认是侦测用户进入围栏的行为，即AMapGeoFenceActiveActionInside，这边设置为进入，离开，停留（在围栏内10分钟以上），都触发回调
    self.geoFenceManager.allowsBackgroundLocationUpdates = YES;  //允许后台定位
    
//    [self.geoFenceManager addKeywordPOIRegionForMonitoringWithKeyword:@"艺嘉国际大酒店" POIType:@"" city:@"深圳" size:20 customID:@"poi_1"];

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(22.557292, 114.125494);
    [self.geoFenceManager addAroundPOIRegionForMonitoringWithLocationPoint:coordinate aroundRadius:500 keyword:@"住宅" POIType:@"" size:20 customID:@"poi_2"];
    
}

- (void)amapGeoFenceManager:(AMapGeoFenceManager *)manager didAddRegionForMonitoringFinished:(NSArray<AMapGeoFenceRegion *> *)regions customID:(NSString *)customID error:(NSError *)error {
    if (error) {
        NSLog(@"创建失败 %@",error);
    } else {
        NSLog(@"创建成功");
    }
}

- (void)amapGeoFenceManager:(AMapGeoFenceManager *)manager didGeoFencesStatusChangedForRegion:(AMapGeoFenceRegion *)region customID:(NSString *)customID error:(NSError *)error {
    if (error) {
        NSLog(@"status changed error %@",error);
    }else{
        NSLog(@"status changed success %@",[region description]);
    }
}

#pragma mark - 定位

//- (void)initCompleteBlock
//{
//    __weak PositioningViewController *weakSelf = self;
//    self.completionBlock = ^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error)
//    {
//        if (error != nil && error.code == AMapLocationErrorLocateFailed)
//        {
//            //定位错误：此时location和regeocode没有返回值，不进行annotation的添加
//            NSLog(@"定位错误:{%ld - %@};", (long)error.code, error.localizedDescription);
//            return;
//        }
//        else if (error != nil
//                 && (error.code == AMapLocationErrorReGeocodeFailed
//                     || error.code == AMapLocationErrorTimeOut
//                     || error.code == AMapLocationErrorCannotFindHost
//                     || error.code == AMapLocationErrorBadURL
//                     || error.code == AMapLocationErrorNotConnectedToInternet
//                     || error.code == AMapLocationErrorCannotConnectToHost))
//        {
//            //逆地理错误：在带逆地理的单次定位中，逆地理过程可能发生错误，此时location有返回值，regeocode无返回值，进行annotation的添加
//            NSLog(@"逆地理错误:{%ld - %@};", (long)error.code, error.localizedDescription);
//        }
//        else if (error != nil && error.code == AMapLocationErrorRiskOfFakeLocation)
//        {
//            //存在虚拟定位的风险：此时location和regeocode没有返回值，不进行annotation的添加
//            NSLog(@"存在虚拟定位的风险:{%ld - %@};", (long)error.code, error.localizedDescription);
//            return;
//        }
//        else
//        {
//            //没有错误：location有返回值，regeocode是否有返回值取决于是否进行逆地理操作，进行annotation的添加
//        }
//
//        NSLog(@"regeocode %@",regeocode);
//
//        //修改label显示内容
//        if (regeocode)
//        {
//            [weakSelf.displayLabel setText:[NSString stringWithFormat:@"%@ \n %@-%@-%.2fm", regeocode.formattedAddress,regeocode.citycode, regeocode.adcode, location.horizontalAccuracy]];
//        }
//        else
//        {
//            [weakSelf.displayLabel setText:[NSString stringWithFormat:@"lat:%f;lon:%f \n accuracy:%.2fm", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy]];
//        }
//    };
//}
//
//- (void)configLocationManager
//{
//    self.locationManager = [[AMapLocationManager alloc] init];
//
//    [self.locationManager setDelegate:self];
//
//    //设置期望定位精度
//    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
//
//    //设置不允许系统暂停定位
//    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
//
//    //设置允许在后台定位
//    [self.locationManager setAllowsBackgroundLocationUpdates:YES];
//
//    //设置定位超时时间
//    [self.locationManager setLocationTimeout:DefaultLocationTimeout];
//
//    //设置逆地理超时时间
//    [self.locationManager setReGeocodeTimeout:DefaultReGeocodeTimeout];
//}
//
//- (void)initDisplayLabel
//{
//    self.displayLabel = [[UILabel alloc] init];
//    self.displayLabel.frame = [UIScreen mainScreen].bounds;
//    self.displayLabel.backgroundColor  = [UIColor clearColor];
//    self.displayLabel.textColor        = [UIColor blackColor];
//    self.displayLabel.textAlignment = NSTextAlignmentCenter;
//    self.displayLabel.numberOfLines = 0;
//
//    [self.view addSubview:_displayLabel];
//}
//
//- (void)cleanUpAction
//{
//    //停止定位
//    [self.locationManager stopUpdatingLocation];
//
//    [self.locationManager setDelegate:nil];
//
//    [self.displayLabel setText:nil];
//}

@end
