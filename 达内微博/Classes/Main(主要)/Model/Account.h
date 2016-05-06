//
//  Account.h
//  达内微博
//
//  Created by tarena on 16/5/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject
@property (nonatomic, copy)NSString *   token;
@property (nonatomic, copy)NSString *   uid;

+(Account *)shareAccount;

-(void)logout;
@end
