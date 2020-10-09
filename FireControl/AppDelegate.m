//
//  AppDelegate.m
//  FireControl
//
//  Created by 杨忠平 on 2020/10/5.
//  Copyright © 2020 杨忠平. All rights reserved.
//

#import "AppDelegate.h"
#import "SVTabBar.h"
#import "SVLandingVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //跳转
//              UIWindow *window = [UIApplication sharedApplication].keyWindow;
//              SVTabBar *tabbar = [[SVTabBar alloc]init];
//               self.window.rootViewController = tabbar;
    SVLandingVC *mainVC = [[SVLandingVC alloc] init];
    UINavigationController *Nav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    self.window.rootViewController = Nav;
    return YES;
}





@end
