//
//  LoginViewController.m
//  达内微博
//
//  Created by tarena on 16/5/5.
//  Copyright © 2016年 tarena. All rights reserved.
//
#define AccountPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Account.plist"]
#import "LoginViewController.h"
#import "WeiboUtils.h"
@interface LoginViewController ()<UIWebViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录页面";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backAction)];
    
    UIWebView *wv = [[UIWebView alloc]initWithFrame:self.view.bounds];
    wv.delegate = self;
    [self.view addSubview:wv];
    
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=3909759463&redirect_uri=http://www.baidu.com"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [wv loadRequest:request];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *path = [request.URL description];
    
    
    NSLog(@"%@",path);
    if ([path containsString:@"code"]) {
        
        NSString *code = [[path componentsSeparatedByString:@"="]lastObject];
        
        [WeiboUtils requestTokenWithCode:code andCallback:^(id obj) {
            
            
            
            NSDictionary *dic = obj;
            [dic writeToFile:AccountPath atomically:YES];
            
            
            NSLog(@"登录成功！");
             [self dismissViewControllerAnimated:YES completion:nil];
        }];
        
        return NO;
    }
    
    return YES;
    
    
}
- (void)backAction {
 
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
