//
//  SynthesizeView.h
//  DuoSet
//
//  Created by mac on 2017/1/18.
//  Copyright © 2017年 Seven-Augus. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SynthesizeViewBlock)(NSInteger);

@interface SynthesizeView : UIView

@property(nonatomic,copy) SynthesizeViewBlock seletedHandle;

@end
