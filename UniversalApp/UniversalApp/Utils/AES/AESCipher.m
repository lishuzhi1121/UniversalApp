//
//  AESCipher.m
//  UniversalApp
//
//  Created by youzu on 2017/8/22.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "AESCipher.h"
#import <CommonCrypto/CommonCryptor.h>

// 密钥
NSString *const kInitVector = @"key";
size_t const kKeySize = kCCKeySizeAES128;

NSData * cipherOperation(NSData *contentData, NSData *keyData, CCOperation operation) {
    NSUInteger dataLength = contentData.length;
    const void *initVectorBytes = [kInitVector dataUsingEncoding:NSUTF8StringEncoding].bytes;
    const void *contentBytes = contentData.bytes;
    const void *keyBytes = keyData.bytes;
    
    size_t operationSize = dataLength + kCCBlockSizeAES128;
    void *operationBytes = malloc(operationSize);
    size_t actualOutSize = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          kCCAlgorithmAES,
                                          kCCOptionPKCS7Padding,
                                          keyBytes,
                                          kKeySize,
                                          initVectorBytes,
                                          contentBytes,
                                          dataLength,
                                          operationBytes,
                                          operationSize,
                                          &actualOutSize);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:operationBytes length:actualOutSize];
    }
    free(operationBytes);
    return nil;
}


NSString * aesEncryptString(NSString *content, NSString *key) {
    NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encrptedData = aesEncryptData(contentData, keyData);
    return [encrptedData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}


NSString * aesDecryptString(NSString *content, NSString *key) {
    NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *decryptedData = aesDecryptData(contentData, keyData);
    return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
}


NSData * aesEncryptData(NSData *contentData, NSData *keyData) {
    return cipherOperation(contentData, keyData, kCCEncrypt);
}


NSData * aesDecryptData(NSData *contentData, NSData *keyData) {
    return cipherOperation(contentData, keyData, kCCDecrypt);
}


NSString * aesEncrypt(NSString *content) {
    return aesEncryptString(content, kInitVector);
}


NSDictionary * aesDecryptWithData(NSData *content) {
    if (!content) {
        return nil;
    }
    NSString *result = [[NSString alloc] initWithData:content encoding:NSUTF8StringEncoding];
    NSData *contentData = [[NSData alloc] initWithBase64EncodedString:result options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *decryptedData = aesDecryptData(contentData, [kInitVector dataUsingEncoding:NSUTF8StringEncoding]);
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:decryptedData options:kNilOptions error:&error];
    if (error) {
        DDLog(@"%@", error);
        return nil;
    }
    return dic;
}
