//
//  CustomRefreshTabView.m
//  JJMedia
//
//  Created by JJJR on 16/6/12.
//  Copyright © 2016年 zhouqixin. All rights reserved.
//

#import "JJRefreshTabView.h"
#import "NoDataBackGroundView.h"

@interface JJRefreshTabView ()

@end

@implementation JJRefreshTabView {
    NoDataBackGroundView *_noDataBackGroundView;
}
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

/**
 *  当无数据时默认显示的的无数据view的方法
 *
 *  @param isShow   是否显示
 *  @param iconName 没有数据的图标
 *  @param title    提示语
 *  @param isDark   是否是深色背景
 */
- (void)setDefaultHeaderViewIsShow:(BOOL)isShow withIconName:(NSString *)iconName withTitle:(NSString *)title withBgColorDark:(BOOL)isClearColor {
    _noDataBackGroundView = [[NoDataBackGroundView alloc] initWithFrame:self.frame];
    if (isClearColor) {
        _noDataBackGroundView.backgroundColor = [UIColor clearColor];
    } else {
        _noDataBackGroundView.backgroundColor = [UIColor whiteColor];
    }
    if (iconName) {
        [_noDataBackGroundView setImagePath:iconName andRemindStr:title];
    } else {
        [_noDataBackGroundView setImagePath:@"NoOrder" andRemindStr:title];
    }
    if (isShow) {
        self.tableHeaderView = _noDataBackGroundView;
    }else {
        self.tableHeaderView = nil;
    }
}

- (void)setIsShowMore:(BOOL)isShowMore {
    _isShowMore = isShowMore;
    self.mj_footer.hidden = !isShowMore;
}

@end
