//
//  CalibrateViewController.m
//  Sprite Kit Pong
//
//  Created by Z on 11/22/15.
//  Copyright © 2015 Božidar Ševo. All rights reserved.
//

#import "CalibrateViewController.h"
#import "MagnetManager.h"

#import "UINavigationController+Orientation.h"

@interface CalibrateViewController ()

@property (nonatomic) MagnetManager *manager;

@property (nonatomic) BOOL isBottomSet;
@property (nonatomic) BOOL isTopSet;
@property (nonatomic) BOOL isLeftSet;
@property (nonatomic) BOOL isRightSet;

@end

@implementation CalibrateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager = [MagnetManager sharedManager];
    [self.manager setup];
    self.isBottomSet = false;
    self.isTopSet = false;
}

- (IBAction)topButtonTapped:(UIButton *)sender {
    self.manager.topCalibrationVal = self.manager.heading.x;
    NSLog(@"Top calibration value set to: %f",self.manager.topCalibrationVal);
    self.isTopSet = true;
    [self dismissCalibrateVC];
}

- (IBAction)bottomButtonTapped:(UIButton *)sender {
    self.manager.bottomCalibrationVal = self.manager.heading.x;
    NSLog(@"Bottom calibration value set to: %f",self.manager.bottomCalibrationVal);
    self.isBottomSet = true;
    [self dismissCalibrateVC];
}

- (IBAction)leftButtonTapped:(UIButton *)sender {
    self.manager.leftCalibrationVal = self.manager.heading.x;
    NSLog(@"Left calibration value set to: %f",self.manager.leftCalibrationVal);
    self.isLeftSet = true;
    [self dismissCalibrateVC];
}


- (IBAction)rightButtonTapped:(UIButton *)sender {
    self.manager.rightCalibrationVal = self.manager.heading.x;
    NSLog(@"Right calibration value set to: %f",self.manager.rightCalibrationVal);
    self.isRightSet = true;
    [self dismissCalibrateVC];
}

-(void)dismissCalibrateVC{
    
    if (self.isBottomSet == true && self.isTopSet == true && self.isLeftSet == true && self.isRightSet == true) {
        
         [self dismissViewControllerAnimated:YES completion:^{
             self.manager.isTopBottomCalibrated = true;
             self.manager.isLeftRightCalibrated = true;
         }];
    }
}

- (BOOL)shouldAutorotate{
    //returns true if want to allow orientation change
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    //decide number of origination tob supported by Viewcontroller.
    return UIInterfaceOrientationMaskAllButUpsideDown;
}


@end
