//
//  SZNetworkHelper.m
//  UniversalApp
//
//  Created by youzu on 2017/8/22.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "SZNetworkHelper.h"
#import <AFNetworking.h>
#import <AFNetworkActivityIndicatorManager.h>
#import "AESCipher.h"
#import "HeaderModel.h"

@implementation SZNetworkHelper

// 全局共享的sessionManager
static AFHTTPSessionManager *_sessionManager;
// 是否开启加密传输
static BOOL _isOpenAES = NO;




/**
 开始监测网络状态
 */
+ (void)load {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

+ (void)initialize {
    _sessionManager = [AFHTTPSessionManager manager];
    _sessionManager.requestSerializer.timeoutInterval = 10.f;
    // 设置服务器返回的结果类型:JSON,HTTP(AFJSONResponseSerializer,AFHTTPResponseSerializer)
    _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", @"text/encode", nil];
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES; //状态栏菊花
    // 开启加密模式
    [self openAES];
}

# pragma mark - 开关AES加密传输

+ (void)openAES {
    _isOpenAES = YES;
    [_sessionManager.requestSerializer setValue:@"text/encode" forHTTPHeaderField:@"Content-Type"];
}

+ (void)closeAES {
    _isOpenAES = NO;
    [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
}




@end

# pragma mark - NSDictionary，NSArray的分类

#ifdef DEBUG

@implementation NSArray (SZ)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *mStr = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mStr appendFormat:@"\t%@,\n", obj];
    }];
    [mStr appendString:@")"];
    return mStr;
}

@end


@implementation NSDictionary (SZ)

-(NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *mStr = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [mStr appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [mStr appendString:@"}\n"];
    return mStr;
}

@end

#endif
