//
//  CustomRefreshTabView.m
//  JJMedia
//
//  Created by JJJR on 16/6/12.
//  Copyright © 2016年 zhouqixin. All rights reserved.
//

#import "JJRefreshTabView.h"

@interface JJRefreshTabView ()

@end

@implementation JJRefreshTabView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    return self;
}
/**
 *  设置上次更新时间
 *
 *  @param lastUpdateKey <#lastUpdateKey description#>
 */
- (void)setLastUpdateKey:(NSString *)lastUpdateKey {
    self.mj_header.lastUpdatedTimeKey = [NSString stringWithFormat:@"%@__updateTimeKey",lastUpdateKey];
    
}
/**
 *  设置代理
 *
 *  @param refreshDelegate <#refreshDelegate description#>
 */
- (void)setRefreshDelegate:(id)refreshDelegate {
    _refreshDelegate = refreshDelegate;
    self.delegate = refreshDelegate;
    self.dataSource = refreshDelegate;
}
/**
 *  设置是否支持刷新
 *
 *  @param CanRefresh <#CanRefresh description#>
 */
- (void)canRefresh:(BOOL)CanRefresh {
    _CanRefresh = CanRefresh;
    if (!CanRefresh) {
        self.mj_header = nil;
        self.mj_footer = nil;
    } else {
        __weak typeof (self)wself = self;

        if (self.mj_header == nil) {
            self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                if ([wself.refreshDelegate respondsToSelector:@selector(refreshTableViewHeader)]) {
                    [wself.refreshDelegate refreshTableViewHeader];
                    [wself reloadData];
                    [wself.mj_header endRefreshing];
                }
            }];
        }
    if (self.mj_footer == nil) {
            self.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                if ([wself.refreshDelegate respondsToSelector:@selector(refreshTableViewFooter)]) {
                    [wself.refreshDelegate refreshTableViewFooter];
                    [wself reloadData];
                    [wself.mj_footer endRefreshing];
                }
                
            }];
        }
    }
}

- (void)setIsShowMore:(BOOL)isShowMore {
    _isShowMore = isShowMore;
    self.mj_footer.hidden = !isShowMore;
}

@end
