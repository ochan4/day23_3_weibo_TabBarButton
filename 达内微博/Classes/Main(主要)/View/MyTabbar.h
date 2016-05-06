//
//  MyTabbar.h
//  达内微博
//
//  Created by tarena on 16/5/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabbarViewController.h"
@interface MyTabbar : UITabBar
//反向调用
@property (nonatomic, weak)MainTabbarViewController *mDelegate;
@end
