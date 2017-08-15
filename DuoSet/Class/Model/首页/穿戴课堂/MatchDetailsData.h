//
//  MatchDetailsData.h
//  DuoSet
//
//  Created by fanfans on 2017/3/11.
//  Copyright © 2017年 Seven-Augus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeMatchProductData.h"

@interface MatchDetailsData : NSObject

@property(nonatomic,copy) NSString *descr;
@property(nonatomic,copy) NSString *home;
@property(nonatomic,copy) NSString *match_id;
@property(nonatomic,copy) NSString *moreDescr;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *picture;
@property(nonatomic,strong) HomeMatchProductData *productEntityOne;
@property(nonatomic,strong) HomeMatchProductData *productEntityTwo;
@property(nonatomic,strong) HomeMatchProductData *productEntityThree;
@property(nonatomic,strong) NSMutableArray *productList;
@property(nonatomic,copy) NSString *sequence;
@property(nonatomic,copy) NSString *status;
@property(nonatomic,copy) NSString *style;
@property(nonatomic,strong) NSArray *tag;
@property(nonatomic,assign) CGFloat headerDesHight;
@property(nonatomic,assign) CGFloat subDesHight;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)dataForDictionary:(NSDictionary *)dic;

@end
