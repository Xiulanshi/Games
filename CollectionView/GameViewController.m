//
//  GameViewController.m
//  Santa
//
//  Created by Xiulan Shi on 11/30/15.
//  Copyright (c) 2015 Xiulan Shi. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

#import "UINavigationController+Orientation.h"

@implementation GameViewController


-(void)loadView{
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    self.view = [[SKView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
    
    // Create and configure the scene.
    SKScene * scene = [GameScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFit;
    
    // Present the scene.
    [skView presentScene:scene];
    
    
}

- (BOOL)shouldAutorotate{
    //returns true if want to allow orientation change
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}



@end
