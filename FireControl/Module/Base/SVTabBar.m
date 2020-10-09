
//
//  SVTabBar.m
//  SAVI
//
//  Created by Sorgle on 17/4/10.
//  Copyright © 2017年 Sorgle. All rights reserved.
//

#import "SVTabBar.h"
#import "DCHomeVC.h"
//#import "SVMessageVC.h"
//#import "SVDiscoverVC.h"
//#import "SVMineVC.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"



#define kThemeColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]

//导航栏的颜色
#define navigationBackgroundColor   ([UIColor colorWithRed:82/255.0f green:116/255.0f blue:242/255.0f alpha:1])
@interface SVTabBar ()

@end



@implementation SVTabBar

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = navigationBackgroundColor;
   
        //创建子控制器
        DCHomeVC *homeVC = [[DCHomeVC alloc]init];
        DCHomeVC *messageVC = [[DCHomeVC alloc]init];
        //    SVDiscoverVC *discoverVC = [[SVDiscoverVC alloc]init];
        DCHomeVC *mineVC = [[DCHomeVC alloc]init];
        //创建控制器数组
        //    NSArray *arr  = @[homeVC,messageVC,discoverVC,mineVC];
        NSArray *arr  = @[homeVC,messageVC,mineVC];
        //创建付值数组
        NSArray *childItemArray = @[
                                    @{kClassKey  : @"YCHomeVC",
                                      kTitleKey  : @"首页",
                                      kImgKey    : @"TabBar_home",
                                      kSelImgKey : @"TabBar_home_high"},
                                    
                                    @{kClassKey  : @"YCMessageVC",
                                      kTitleKey  : @"查询销售",
                                      kImgKey    : @"TabBar_Query",
                                      kSelImgKey : @"TabBar_Query_high"},
                                    
                                    
                                    @{kClassKey  : @"YCMineVC",
                                      kTitleKey  : @"我的",
                                      kImgKey    : @"TabBar_mine",
                                      kSelImgKey : @"TabBar_mine_high"}
                                    ];
        
        //遍历数组
        [childItemArray enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull dic, NSUInteger idx, BOOL * _Nonnull stop) {
            //创建导航控制器
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:arr[idx]];
            nav.visibleViewController.title = dic[kTitleKey];
            
            //解决渲染的方法
            nav.navigationBar.translucent = NO;
            
            //把状态栏(UIStatusBar)字体颜色设置为白色
            //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            
            //设置tabBar的图片
            UITabBarItem *item = nav.tabBarItem;
            item.image = [UIImage imageNamed:dic[kImgKey]];
            //[item setBackgroundImage:[UIImage imageNamed:@""]];
            //选中图使用该方法设置 避免被渲染
            item.selectedImage = [[UIImage imageNamed:dic[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [item setTitleTextAttributes:@{NSForegroundColorAttributeName : navigationBackgroundColor} forState:UIControlStateSelected];
            
            [self addChildViewController:nav];
        }];
 
    
    
    
}


@end
