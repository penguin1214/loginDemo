//
//  ViewController.m
//  loginDemo
//
//  Created by 杨京蕾 on 4/29/16.
//  Copyright (c) 2016 yang. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "BaseEntity.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize usernameText;
@synthesize passwordText;

- (IBAction)loginButton:(id)sender {
    //获取输入的账号密码
    NSString *username = usernameText.text;
    NSString *password = passwordText.text;
    //请求的参数
//    NSDictionary *parameters = @{@"username": @"1",
//                                   @"password":@"2"
//                                   };
    BaseEntity* entity = [[BaseEntity alloc] init];
    entity.name = username;
    entity.id = [password integerValue];
    
    NSDictionary* parameters = [entity toDictionary];
//    请求的url
    NSString *urlString = @"http://localhost:5000/test";
    //请求的managers
//    AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];     //用于接收json类型数据
    manager.requestSerializer = [AFJSONRequestSerializer serializer];   //用于发送json类型数据
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];   //用于接收html请求
    [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    //请求的方式：POST
    
//    [managers POST:urlString parameters:parameters
//          success:^(AFHTTPRequestOperation *operation, id responseObject) {
//              NSLog(@"login success!!!");
//              // 解析服务器返回来的json数据（AFNetworking默认解析json数据）
////              if (responseObject != nil) {
////                  NSDictionary *respObj = responseObject;
////                  NSString *result = [respObj objectForKey:@"result"];
////                  if (result && [result isEqualToString:@"ok"]) {
////                      NSLog(@"the result :%@", result);
////                  }
////              }
//          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//              NSLog(@"err:%@", error);
//          }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
