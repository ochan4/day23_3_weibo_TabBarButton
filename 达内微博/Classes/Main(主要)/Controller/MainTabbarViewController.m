//
//  MainTabbarViewController.m
//  达内微博
//
//  Created by tarena on 16/5/5.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "SendWeiboViewController.h"
#import "MainTabbarViewController.h"
#import "FirendsViewController.h"
#import "HomeViewController.h"
#import "SettingsViewController.h"
#import "UserInfoViewController.h"
#import "MyTabbar.h"
@interface MainTabbarViewController ()

@end

@implementation MainTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建页面
    HomeViewController *hvc = [HomeViewController new];
    FirendsViewController *fvc = [FirendsViewController new];
    UserInfoViewController *uvc = [UserInfoViewController new];
    SettingsViewController *svc = [SettingsViewController new];
    
    //设置标题
    hvc.title = @"首页";
    fvc.title = @"好友";
    uvc.title = @"用户";
    svc.title = @"设置";
    
    //图片名数组
    NSArray *menuImageNames = @[@"01全部话题_14.png",@"05侧滑分栏_12.png",@"05侧滑分栏_14.png",@"05侧滑分栏_17.png"];
    
    //设置tabbar图片
    hvc.tabBarItem.image = [UIImage imageNamed:menuImageNames[0]];
    fvc.tabBarItem.image = [UIImage imageNamed:menuImageNames[1]];
    uvc.tabBarItem.image = [UIImage imageNamed:menuImageNames[2]];
    svc.tabBarItem.image = [UIImage imageNamed:menuImageNames[3]];
    
    //添加子页面
    [self addChildViewController:[[UINavigationController alloc]initWithRootViewController:hvc]];
    [self addChildViewController:[[UINavigationController alloc]initWithRootViewController:fvc]];
    [self addChildViewController:[[UINavigationController alloc]initWithRootViewController:uvc]];
    [self addChildViewController:[[UINavigationController alloc]initWithRootViewController:svc]];
    
    //创建新tabbar:替换系统的tabbar
    MyTabbar *tabbar = [[MyTabbar alloc]initWithFrame:self.tabBar.frame];
    
    tabbar.mDelegate = self;
    
    //KVC
    [self setValue:tabbar forKey:@"tabBar"];
    
    //点中的文字颜色
    self.tabBar.tintColor = [UIColor orangeColor];
}

//点击中间的按钮：跳转到发送页面
- (void)sendAction {

    NSLog(@"发送");
    
    SendWeiboViewController *vc = [[SendWeiboViewController alloc]init];
    
    [self presentViewController:[[UINavigationController alloc]initWithRootViewController:vc] animated:YES completion:nil];
}



@end
