//
//  AppDelegate+AppService.h
//  UniversalApp
//
//  Created by youzu on 2017/8/4.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "AppDelegate.h"

/**
 包含第三方 和 应用内业务的实现
 */
@interface AppDelegate (AppService)

/**
 初始化 Window
 */
- (void)initWindow;

/**
 初始化 App服务
 */
- (void)initAppService;

/**
 获取当前顶层控制器

 @return 控制器
 */
- (UIViewController *)getCurrentVC;

/**
 获取当前顶层UI控制器

 @return 控制器
 */
- (UIViewController *)getCurrentUIVC;

@end
