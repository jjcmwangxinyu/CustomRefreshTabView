//
//  NoDataBackGroundView.m
//  JJMedia
//
//  Created by 众钱 iOS 高强 on 16/6/29.
//  Copyright © 2016年 zhouqixin. All rights reserved.
//

#import "NoDataBackGroundView.h"
#define HEXCOLORRGBA(X, A)                          [UIColor colorWithRed:((float) ((X & 0xFF0000) >> 16)) / 255.0 green:((float) ((X & 0xFF00) >> 8)) / 255.0 blue:((float) (X & 0xFF)) / 255.0 alpha:A]
#define HEXCOLOR(X)                                 HEXCOLORRGBA(X, 1.0)
@interface NoDataBackGroundView () {
    UIImageView *_iconImage;//图标
    UILabel *_remindLabel;//提示语
}

@end

@implementation NoDataBackGroundView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;//这里需要减去导航栏的高度
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setImagePath:(NSString *)imagePath andRemindStr:(NSString *)remindStr {
    _iconImage          = [[UIImageView alloc] init];
    CGPoint imageCenter = self.center;
    _iconImage.center   = imageCenter;
    CGSize imageSize    = CGSizeMake(97, 125);
    CGRect imageFrame   = _iconImage.frame;
    imageFrame.size     = imageSize;
    _iconImage.frame    = imageFrame;
    _iconImage.contentMode = UIViewContentModeScaleAspectFit;
    [_iconImage setImage:[UIImage imageNamed:imagePath]];
    [self addSubview:_iconImage];
    
    _remindLabel        = [[UILabel alloc] init];
    CGPoint labelCenter = CGPointMake(self.center.x, self.center.y + 77);
    _remindLabel.center = labelCenter;
    CGSize labelSize    = CGSizeMake(120, 20);
    CGRect labelFrame   = _remindLabel.frame;
    labelFrame.size     = labelSize;
    _iconImage.frame    = labelFrame;
    _remindLabel.text   = remindStr;
    _remindLabel.textColor = [UIColor colorWithRed:128/255.0f green:128/255.0f blue:128/255.0f alpha:1.0f];
    _remindLabel.textColor = HEXCOLOR(0xcccccc);
    _remindLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_remindLabel];
}

@end
