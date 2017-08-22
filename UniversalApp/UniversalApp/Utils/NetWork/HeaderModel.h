//
//  HeaderModel.h
//  UniversalApp
//
//  Created by youzu on 2017/8/22.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 header 参数 model
 */
@interface HeaderModel : NSObject

/**
 用户 ID
 */
@property (assign, nonatomic) long long userid;

/**
 设备号
 */
//@property (copy, nonatomic) NSString *imei;

/**
 系统类型 0未知,1安卓,2iOS
 */
@property (assign, nonatomic) NSInteger os_type;

/**
 当前App版本
 */
@property (copy, nonatomic) NSString *version;

/**
 来源渠道 iOS使用:@"App Store"
 */
@property (copy, nonatomic) NSString *channel;

/**
 客户端唯一标识,后台用来判断是否更换新设备
 */
@property (copy, nonatomic) NSString *clientId;

/**
 内部维护的应用版本号 随版本递增
 */
@property (assign, nonatomic) NSInteger versionCode;

/**
 手机型号
 */
@property (copy, nonatomic) NSString *mobile_model;

/**
 手机品牌
 */
@property (copy, nonatomic) NSString *mobile_brand;

/**
 用户登录后分配的登录Token
 */
@property (copy, nonatomic) NSString *token;

@end
