//
//  NewWaittingReceiveTableView.m
//  DuoSet
//
//  Created by fanfans on 2017/5/11.
//  Copyright © 2017年 Seven-Augus. All rights reserved.
//

#import "NewWaittingReceiveTableView.h"
#import "OrderListMainCell.h"

@interface NewWaittingReceiveTableView()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic,strong) NSMutableArray *itemArr;

@end

@implementation NewWaittingReceiveTableView

+ (NewWaittingReceiveTableView *)contentTableViewAndHeaderRefreshBlock:(void (^)())headerBlock footRefreshBlock:(void (^)())footBlock{
    NewWaittingReceiveTableView *contentTV = [[NewWaittingReceiveTableView alloc] initWithFrame:CGRectMake(mainScreenWidth * 2, 0, [UIScreen mainScreen].bounds.size.width, mainScreenHeight - 64 - FitHeight(80)) style:UITableViewStyleGrouped];
    contentTV.backgroundColor = [UIColor clearColor];
    contentTV.dataSource = contentTV;
    contentTV.delegate = contentTV;
    contentTV.separatorStyle = UITableViewCellSeparatorStyleNone;
    contentTV.showsVerticalScrollIndicator = false;
    contentTV.mj_header= [FFGifHeader headerWithRefreshingBlock:^{
        headerBlock();
    }];
    contentTV.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        footBlock();
    }];
    return contentTV;
}

-(void)setupInfoWithDuoSetOrderArr:(NSMutableArray *)itemArr{
    _itemArr = itemArr;
    [self reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _itemArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DuojiOrderData *item = _itemArr[indexPath.section];
    return item.mainCellHight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DuojiOrderData *item = _itemArr[indexPath.section];
    NSString *OrderListMainCellID = [NSString stringWithFormat:@"OrderListMainCellID-%ld",item.orderDetailResponses.count];
    OrderListMainCell * cell = [tableView dequeueReusableCellWithIdentifier:OrderListMainCellID];
    if (cell == nil) {
        cell = [[OrderListMainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:OrderListMainCellID andDuoSetOrder:item];
    }
    [cell setupInfoWithDuoSetOrder:item];
    cell.productTapHandle = ^(DuojiOrderData *order, NSInteger index) {
        WaittingReceiveTableViewProductActionBlock block = _productTapAction;
        if (block) {
            block(order,index);
        }
    };
    cell.btnActionHandle = ^(DuojiOrderData *order, NSInteger index) {
        WaittingReceiveTableViewBtnActionBlock block = _cellBtnAction;
        if (block) {
            block(order,index);
        }
    };
    cell.cellDeletedHandle = ^(DuojiOrderData *order) {
        TableViewDeleteBlock block = _deleteHandle;
        if (block) {
            block(order);
        }
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return .1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DuojiOrderData *item = _itemArr[indexPath.section];
    WaittingReceiveTableViewDetailBlock block = _cellSeletcedAction;
    if (block) {
        block(item);
    }
}

@end
