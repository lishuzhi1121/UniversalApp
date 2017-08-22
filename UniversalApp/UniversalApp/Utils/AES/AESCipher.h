//
//  AESCipher.h
//  UniversalApp
//
//  Created by youzu on 2017/8/22.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 AES加解密的二次封装
 */
NSString * aesEncrypt(NSString *content);
NSDictionary * aesDecryptWithData(NSData *content);

NSString * aesEncryptString(NSString *content, NSString *key);
NSString * aesDecryptString(NSString *content, NSString *key);

NSData * aesEncryptData(NSData *contentData, NSData *keyData);
NSData * aesDecryptData(NSData *contentData, NSData *keyData);
