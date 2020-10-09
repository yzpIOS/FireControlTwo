//
//  AppDelegate.h
//  FireControl
//
//  Created by 杨忠平 on 2020/10/5.
//  Copyright © 2020 杨忠平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

/**
 * 是否允许转向
 */
@property(nonatomic,assign)BOOL allowRotation;

@end

