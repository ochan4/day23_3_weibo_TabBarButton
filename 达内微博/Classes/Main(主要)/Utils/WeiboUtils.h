//
//  WeiboUtils.h
//  达内微博
//
//  Created by tarena on 16/5/5.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "AFNetworking.h"
#import <Foundation/Foundation.h>
typedef void (^MyCallback)(id obj);
@interface WeiboUtils : NSObject


+(void)requestTokenWithCode:(NSString *)code andCallback:(MyCallback)callback;

+(void)sendWeiboWithText:(NSString *)text andCallback:(MyCallback)callback;

+(void)sendWeiboWithText:(NSString *)text andImageData:(NSData *)data andCallback:(MyCallback)callback;

@end
