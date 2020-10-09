//
//  NSData+SFKEncrypt.h
//  SFKStudentCenterNew
//
//  Created by sfk-ios on 2017/4/18.
//  Copyright © 2017年 北京斯芬克教育咨询有限公司. All rights reserved.
//  加密

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData (SFKEncrypt)
- (NSString *)base64Encoding;
+ (id)dataWithBase64EncodedString:(NSString *)string;
- (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv;
- (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv;
@end
