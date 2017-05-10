//
//  ViewController.m
//  YFImageButton
//
//  Created by admin on 17/5/5.
//  Copyright © 2017年 Yvan Wang. All rights reserved.
//

#import "ViewController.h"
#import "YFImageButton.h"

@interface ViewController (){
    NSInteger currentIndex;
    YFImageButton *imageButton;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    //    YFImageButton *imageButton = [[YFImageButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    imageButton = [YFImageButton buttonWithType:UIButtonTypeCustom];
    imageButton.frame = CGRectMake(100, 100, 120, 160);
    imageButton.backgroundColor = [UIColor yellowColor];
//    imageButton.title = @"传递的内容";
    
    [imageButton setTitle:@"传递的内容哈哈哈哈哈哈哈哈" forState:UIControlStateNormal];//用到的是父类的label
    [imageButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [imageButton setImage:[UIImage imageNamed:@"name"] forState:UIControlStateNormal];
    imageButton.titleLabel.numberOfLines = 0;
    imageButton.titleLabel.font = [UIFont systemFontOfSize:11];
    imageButton.orientation = currentIndex;//YFImageButtonVerticalImageFirst;
    imageButton.edgeMargin = UIEdgeInsetsMake(10, 10, 10, 10);
    imageButton.imageSize = CGSizeMake(60, 60);
    imageButton.gap = 20;
    [self.view addSubview:imageButton];
    
    [self setOrientation:currentIndex];
    
    UIButton *changeButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 400, 100, 50)];
    [changeButton setTitle:@"改变状态" forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(changButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
    
}

-(void)changButtonTapped:(UIButton *)button{
    currentIndex++;
    if(currentIndex > 3) currentIndex = 0;
    [self setOrientation:currentIndex];
}

-(void)setOrientation:(NSInteger)index{
    imageButton.orientation = currentIndex;
    self.title = [self convertFromEnum:currentIndex];
}

-(NSString *)convertFromEnum:(YFImageButtonOrientationType)type{
    switch (type) {
        case YFImageButtonHorizontalImageFirst:
            return @"左边图片";
            break;
        case YFImageButtonHorizontalTitleFirst:
            return @"左边文字";
            break;
        case YFImageButtonVerticalImageFirst:
            return @"上边图片";
            break;
        case YFImageButtonVerticalTitleFirst:
            return @"上边文字";
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
