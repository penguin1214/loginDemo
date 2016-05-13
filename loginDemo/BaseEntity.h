//
//  BaseEntity.h
//  loginDemo
//
//  Created by 杨京蕾 on 5/11/16.
//  Copyright © 2016 yang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface BaseEntity : JSONModel

@property (assign, nonatomic) NSInteger id;
@property (strong, nonatomic) NSString* name;

@end
