//
//  MyCollectionCell.h
//  DuoSet
//
//  Created by Wong Mr on 2016/12/7.
//  Copyright © 2016年 Seven-Augus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;



@end
