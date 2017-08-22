//
//  HeaderModel.m
//  UniversalApp
//
//  Created by youzu on 2017/8/22.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "HeaderModel.h"

@implementation HeaderModel

- (instancetype)init {
    if (self = [super init]) {
        self.userid = 123456;
        self.os_type = 2;
        self.version = [UIApplication sharedApplication].appVersion;
        self.channel = @"App Store";
        self.clientId = @"udid";
        self.versionCode = kVersionCode;
        self.mobile_model = [UIDevice currentDevice].machineModelName;
        self.mobile_brand = [UIDevice currentDevice].machineModel;
    }
    return self;
}

@end
