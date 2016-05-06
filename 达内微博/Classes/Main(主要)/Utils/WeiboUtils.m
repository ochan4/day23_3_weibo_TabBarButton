//
//  WeiboUtils.m
//  达内微博
//
//  Created by tarena on 16/5/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WeiboUtils.h"

@implementation WeiboUtils
+(void)requestTokenWithCode:(NSString *)code andCallback:(MyCallback)callback{
    
    
    NSString *path = @"https://api.weibo.com/oauth2/access_token";
    NSDictionary *params = @{@"client_id":@"3909759463",@"client_secret":@"19f9eb3b9c63ada92f9deed514288654",@"grant_type":@"authorization_code",@"redirect_uri":@"http://www.baidu.com",@"code":code};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    
    [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSLog(@"%@",dic);
        
        callback(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@",error);
    }];
    

}

+(void)sendWeiboWithText:(NSString *)text andCallback:(MyCallback)callback{
    
    NSString *path = @"https://api.weibo.com/2/statuses/update.json";
    NSDictionary *params = @{@"access_token":[Account shareAccount].token,@"status":text};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    
    [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSLog(@"%@",dic);
        
        callback(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@",error);
    }];
    
    
    
    
}

+(void)sendWeiboWithText:(NSString *)text andImageData:(NSData *)data andCallback:(MyCallback)callback{
    
    
    NSString *path = @"https://upload.api.weibo.com/2/statuses/upload.json";
    NSDictionary *params = @{@"access_token":[Account shareAccount].token,@"status":text};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //把图片的数据添加到了请求体里面
        [formData appendPartWithFileData:data name:@"pic" fileName:@"asdf.jpg" mimeType:@"image/jpg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSLog(@"%@",dic);
        
        callback(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"请求失败：%@",error);
    }];
    
    
    
}
@end
