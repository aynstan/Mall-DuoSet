//
//  OutFitDetailProduct.h
//  DuoSet
//
//  Created by fanfans on 12/29/16.
//  Copyright © 2016 Seven-Augus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OutFitDetailProduct : NSObject

@property(nonatomic,copy) NSString *productId;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *price;
@property(nonatomic,copy) NSString *smallImg;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)dataForDictionary:(NSDictionary *)dic;

@end
