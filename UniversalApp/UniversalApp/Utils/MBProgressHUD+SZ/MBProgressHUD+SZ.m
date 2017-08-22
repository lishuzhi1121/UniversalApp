//
//  MBProgressHUD+SZ.m
//  UniversalApp
//
//  Created by youzu on 2017/8/17.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MBProgressHUD+SZ.h"

@implementation MBProgressHUD (SZ)

# pragma mark - 顶部Tip

+ (void)showTopTipMessage:(NSString *)msg isWindow:(BOOL)isWindow {
    CGFloat padding = 10.0;
    
    YYLabel *label = [[YYLabel alloc] init];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.8];
    label.width = kScreenWidth;
    label.textContainerInset = UIEdgeInsetsMake(padding + padding, 0, padding, padding);
    
    if (isWindow) {
        label.height = 64;
        label.bottom = 0;
        [[UIApplication sharedApplication].delegate.window addSubview:label];
        
        [UIView animateWithDuration:0.3 animations:^{
            label.top = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                label.bottom = 0;
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        }];
        
    } else {
        label.height = [msg heightForFont:label.font width:label.width] + 2 * padding;
        label.bottom = (kiOS7Later ? 64 : 0);
    }
    
}

@end
