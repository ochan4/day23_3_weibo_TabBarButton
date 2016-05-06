//
//  Account.m
//  达内微博
//
//  Created by tarena on 16/5/5.
//  Copyright © 2016年 tarena. All rights reserved.
//



#import "Account.h"
static Account *_account;
@implementation Account

+(Account *)shareAccount{
    

    @synchronized(self) {
    
        if (!_account) {
            NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:AccountPath];
            if (dic) {
                _account = [[Account alloc]init];
                _account.token = dic[@"access_token"];
                _account.uid = dic[@"uid"];
            }
        }
    }
    
    return _account;
}

-(void)logout{
    
    [[NSFileManager defaultManager]removeItemAtPath:AccountPath error:nil];
    
    _account = nil;
    
    
}
@end
