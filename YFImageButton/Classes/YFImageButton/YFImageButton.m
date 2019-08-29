//
//  YFImageButton.m
//  YFImageButton
//
//  Created by admin on 17/5/5.
//  Copyright © 2017年 Yvan Wang. All rights reserved.
//

#import "YFImageButton.h"

#define kMinEdgeMargin UIEdgeInsetsMake(5, 5, 5, 5)
#define kSelfSize self.frame.size


@implementation YFImageButton

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        //添加子控件, frame在layoutSubviews里设置
        _orientation = YFImageButtonHorizontalTitleFirst;
        _edgeMargin = kMinEdgeMargin;
        _gap = 10.0;
        _imageSize = CGSizeZero;
    }
    return self;
}


//在frame确定的情况下
//如果直接使用init来初始化  这个时候当前view的frame还没设置好，
//因此子控件的frame不能够在init或者最好不要在initWithFrame中设置
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize imageSize = self.imageView.frame.size;
  
    //同时有图片和文字的情况下 进行处理
    if(!CGSizeEqualToSize(titleSize, CGSizeZero) &&
       !CGSizeEqualToSize(imageSize, CGSizeZero)){
        
        //在同时有图片和文字的情况下  会可能会导致图片和文字的Rect变小
        titleSize = [self.titleLabel.text boundingRectWithSize:kSelfSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size;
        
        if(CGSizeEqualToSize(CGSizeZero, _imageSize)){
            CGFloat newImageHeight, newImageWidth;
            //如果不设置的话 图片有一个默认的大小
            if(imageSize.height >= imageSize.width){
                //取小的
                newImageWidth = imageSize.width;
                newImageHeight = newImageWidth * imageSize.height / imageSize.width;
            }else{
                newImageHeight = imageSize.height;
                newImageWidth = newImageHeight * imageSize.width / imageSize.height;
            }
            imageSize = CGSizeMake(newImageWidth, newImageHeight);
        }else{
            imageSize = _imageSize;
        }
        
        CGFloat totalWidth, totalHeight;
        CGRect newTitleRect, newImageRect;
        switch (_orientation) {
            case YFImageButtonHorizontalImageFirst:
            case YFImageButtonHorizontalTitleFirst:{
                CGFloat centerX = (kSelfSize.width - _edgeMargin.left - _edgeMargin.right) / 2.0 + _edgeMargin.left;
                totalWidth = _gap + imageSize.width + titleSize.width;
                
                if(_orientation == YFImageButtonHorizontalImageFirst){
                    newTitleRect = CGRectMake(centerX + totalWidth / 2.0 - titleSize.width, (kSelfSize.height - titleSize.height) / 2.0, titleSize.width, titleSize.height);
                    newImageRect = CGRectMake(centerX - totalWidth / 2.0,(kSelfSize.height - imageSize.height) / 2.0, imageSize.width, imageSize.height);
                }else{
                    newTitleRect = CGRectMake(centerX - totalWidth / 2.0, (kSelfSize.height - titleSize.height) / 2.0,titleSize.width, titleSize.height);
                    newImageRect = CGRectMake(centerX + totalWidth / 2.0 - imageSize.width, (kSelfSize.height - imageSize.height) / 2.0, imageSize.width, imageSize.height);
                }}
                break;
            case YFImageButtonVerticalImageFirst:
            case YFImageButtonVerticalTitleFirst:{
                CGFloat centerY = (kSelfSize.height - _edgeMargin.top - _edgeMargin.bottom) / 2.0 + _edgeMargin.top;
                totalHeight = _gap + imageSize.height + titleSize.height;

                if(_orientation == YFImageButtonVerticalImageFirst){
                    newTitleRect = CGRectMake((kSelfSize.width - titleSize.width) / 2.0, centerY + totalHeight / 2.0 - titleSize.height, titleSize.width, titleSize.height);
                    newImageRect = CGRectMake((kSelfSize.width - imageSize.width) / 2.0, centerY - totalHeight / 2.0, imageSize.width, imageSize.height);
                }else{
                    newTitleRect = CGRectMake((kSelfSize.width - titleSize.width) / 2.0, centerY - totalHeight / 2.0, titleSize.width, titleSize.height);
                    newImageRect = CGRectMake((kSelfSize.width - imageSize.width) / 2.0, centerY + totalHeight / 2.0 - imageSize.height, imageSize.width, imageSize.height);
                }}
                break;
        }
        
        self.titleLabel.frame = newTitleRect;
        self.imageView.frame = newImageRect;
    }
}

-(void)setOrientation:(YFImageButtonOrientationType)orientation{
    if(_orientation != orientation){
        _orientation = orientation;
        [self setNeedsLayout];
    }
}

-(void)setEdgeMargin:(UIEdgeInsets)edgeMargin{
    if(!UIEdgeInsetsEqualToEdgeInsets(_edgeMargin, edgeMargin)){
        _edgeMargin = edgeMargin;
        [self setNeedsLayout];
    }
}

-(void)setImageSize:(CGSize)imageSize{
    if(!CGSizeEqualToSize(imageSize, _imageSize)){
        _imageSize = imageSize;
        [self setNeedsLayout];
    }
}

-(void)setGap:(CGFloat)gap{
    if(_gap != gap){
        _gap = gap;
        [self setNeedsLayout];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
