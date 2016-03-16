//
//  AppDelegate.m
//  PalaceByObjectC
//
//  Created by 陈梦楼 on 16/3/9.
//  Copyright © 2016年 chenmenglou. All rights reserved.
//

#import "AppDelegate.h"
#import "PalaceRouteController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)initPalaceRouteController{
    _window=[[UIWindow alloc] init];
    _window.frame=CGRectMake(0, 0, kDEVICEWIDTH, kDEVICEHEIGHT);
    PalaceRouteController *_tempPalaceRouteController=[[PalaceRouteController alloc] init];
    UINavigationController *na=[[UINavigationController alloc] initWithRootViewController:_tempPalaceRouteController];
    _window.backgroundColor=[UIColor whiteColor];
    _window.rootViewController=na;
    [_window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initPalaceRouteController];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
