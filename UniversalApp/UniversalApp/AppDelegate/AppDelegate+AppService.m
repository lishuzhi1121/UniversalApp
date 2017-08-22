//
//  AppDelegate+AppService.m
//  UniversalApp
//
//  Created by youzu on 2017/8/4.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "AppDelegate+AppService.h"

@implementation AppDelegate (AppService)

# pragma mark - 初始化 Window

- (void)initWindow {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

# pragma mark - 初始化AppService

- (void)initAppService {
    // 网络状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkStateChange:)
                                                 name:KNotificationNetWorkStateChange
                                               object:nil];
    
    // 注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:kNotificationLoginStateChange
                                               object:nil];
}


# pragma mark - 网络状态变化

- (void)networkStateChange:(NSNotification *)notification {
    
    BOOL hasNetWork = [notification.object boolValue];
    if (hasNetWork) {
        
    } else {
        
    }
}

# pragma mark - 登录状态变化

- (void)loginStateChange:(NSNotification *)notification {
    
    
}

# pragma mark - 获取App当前控制器

- (UIViewController *)getCurrentVC {
    
    UIViewController *result = nil;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [UIApplication sharedApplication].windows;
        for (UIWindow *tmpWindow in windows) {
            if (tmpWindow.windowLevel == UIWindowLevelNormal) {
                window = tmpWindow;
                break;
            }
        }
    }
    
    UIView *frontView = window.subviews.firstObject;
    id nextResponder = frontView.nextResponder;
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    
    return result;
}


- (UIViewController *)getCurrentUIVC {
    
    UIViewController *superVC = [self getCurrentVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController *tabSelectedVC = ((UITabBarController *)superVC).selectedViewController;
        
        if ([tabSelectedVC isKindOfClass:[UINavigationController class]]) {
            return ((UINavigationController *)tabSelectedVC).viewControllers.lastObject;
        }
        
        return tabSelectedVC;
        
    } else if ([superVC isKindOfClass:[UINavigationController class]]) {
        
        return ((UINavigationController *)superVC).viewControllers.lastObject;
    }
    
    return superVC;
}



@end
