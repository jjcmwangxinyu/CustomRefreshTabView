//
//  NoDataBackGroundView.h
//  JJMedia
//
//  Created by 众钱 iOS 高强 on 16/6/29.
//  Copyright © 2016年 zhouqixin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoDataBackGroundView : UIView

/**
 *  设置没有数据时的提示框(注：自动居中，使用时直接init即可)
 *
 *  @param imagePath 图片地址（图片名）
 *  @param remindStr 提示语
 */
- (void)setImagePath:(NSString *)imagePath andRemindStr:(NSString *)remindStr;

@end
