//
//  YFImageButton.h
//  YFImageButton
//
//  Created by admin on 17/5/5.
//  Copyright © 2017年 Yvan Wang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, YFImageButtonOrientationType) {
    //水平
    YFImageButtonHorizontalImageFirst = 0,//左边图片
    YFImageButtonHorizontalTitleFirst,//左边文字
    
    //竖直
    YFImageButtonVerticalImageFirst,//上边图片
    YFImageButtonVerticalTitleFirst,//上边文字
};


@interface YFImageButton : UIButton{
    
}

@property (nonatomic, assign) YFImageButtonOrientationType orientation; //default : YFImageButtonHorizontalTitleFirst
@property (nonatomic, assign) UIEdgeInsets edgeMargin;  //default : CGSizeZero
@property (nonatomic, assign) CGSize imageSize; //default :UIEdgeInsetsMake(5, 5, 5, 5)
@property (nonatomic, assign) CGFloat gap;  //default : 10.0

@end
