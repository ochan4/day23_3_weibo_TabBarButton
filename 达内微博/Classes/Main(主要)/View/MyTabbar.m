//
//  MyTabbar.m
//  达内微博
//
//  Created by tarena on 16/5/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MyTabbar.h"

@implementation MyTabbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //创建一个新的按钮（+按钮）
        UIButton *sendWeiboBtn = [[UIButton alloc]initWithFrame:CGRectMake(152, 1, 71, 48)];
        
        //设置图片
        [sendWeiboBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted.png"] forState:UIControlStateNormal];
        
        //设置背景图片
        [sendWeiboBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted.png"] forState:UIControlStateNormal];
        
        //添加到主页面
        [self addSubview:sendWeiboBtn];
        
        //给按钮添加target方法: addTarget:只能倒页面
        [sendWeiboBtn addTarget:self.mDelegate action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

//系统方法：控件的布局方法 每次显示之前会调用
-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSLog(@"%@",self.subviews);
    
    //UIBarItem继承UIView所以用UIView方可
    /*bar里面的
     subview[0]= view,
     subview[1]= + ,
     subview[2]=首页,
     subview[3]=好友,
     subview[4]=用户,
     subview[5]=设置 */
    UIView *haoyouItem = self.subviews[3];
    UIView *yonghuItem = self.subviews[4];
    
    //改变barItem位置
    haoyouItem.center = CGPointMake(115, haoyouItem.center.y);
    yonghuItem.center = CGPointMake(260, yonghuItem.center.y);
}


@end
