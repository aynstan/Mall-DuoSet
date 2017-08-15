//
//  TopVCDataModel.h
//  DuoSet
//
//  Created by Wong Mr on 2016/12/19.
//  Copyright © 2016年 Seven-Augus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopVCDataModel : NSObject

@property (nonatomic, copy) NSString *bigImgs;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *topItemId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *price;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)dataForDictionary:(NSDictionary *)dic;

@end
