//
//  UtilsMacros.h
//  UniversalApp
//
//  Created by youzu on 2017/8/17.
//  Copyright © 2017年 mob. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

// 屏幕宽高
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreenBounds ([UIScreen mainScreen].bounds)


// DEBUG 模式下打印日志
#ifdef DEBUG
#define DDLog(fmt, ...) NSLog((@"%s [LINE %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DDLog(...)
#endif



#endif /* UtilsMacros_h */
