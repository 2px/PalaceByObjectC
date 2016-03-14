//
//  ADSlideComponent.m
//  PalaceByObjectC
//
//  Created by 陈梦楼 on 16/3/10.
//  Copyright © 2016年 chenmenglou. All rights reserved.
//

#import "ADSlideComponent.h"


@interface ADSlideComponent ()
{
    __weak id myObj;
    ADSlideComponentBlcok callbackBlock;
}
@end

@implementation ADSlideComponent

- (instancetype)initWithObj:(id)obj andImageIs:(NSString *)img andCallbackIs:(ADSlideComponentBlcok)b
{
    self = [super init];
    if (self) {
        myObj=obj;
        [self createADSlideIn:obj andImgIs:img];
        callbackBlock=b;
    }
    return self;
}

-(void)createADSlideIn:(id)obj andImgIs:(NSString*)img{
    UIView *boxView=[[UIView alloc] init];
    boxView.frame=CGRectMake(0, 0, kDEVICEWIDTH, kDEVICEHEIGHT);
    boxView.backgroundColor=[UIColor clearColor];
    
    UIView *bgColor=[[UIView alloc] init];
    bgColor.frame=CGRectMake(0, 0, kDEVICEWIDTH, kDEVICEHEIGHT);
    bgColor.backgroundColor=RGBAlphaColor(0, 0, 0, 0.71);
    bgColor.userInteractionEnabled=YES;
    UITapGestureRecognizer *gest=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [bgColor addGestureRecognizer:gest];
    [boxView addSubview:bgColor];
    
    UIView *containView=[[UIView alloc] init];
    containView.backgroundColor=[UIColor clearColor];
    containView.layer.cornerRadius=3;
    [boxView addSubview:containView];
    [containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(boxView).with.offset(12);
        make.centerY.equalTo(boxView);
        make.top.equalTo(boxView).with.offset(119);
        make.bottom.equalTo(boxView).with.offset(-130);
        make.width.equalTo(@(kDEVICEWIDTH-24));
    }];
    containView.layer.borderWidth=2;
    containView.layer.borderColor=[UIColor whiteColor].CGColor;
    
    UIImage *x=[UIImage imageNamed:@"tFHomeBombBoxClose"];
    UIImageView *xView=[[UIImageView alloc] initWithImage:x];
    [boxView addSubview:xView];
    [xView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(containView.mas_top);
        make.left.equalTo(containView.mas_right).with.offset(-40);
        make.width.equalTo(@30);
        make.height.equalTo(@90);
    }];
    
    UIImage *_img=[UIImage imageNamed:img];
    UIImageView *_imgView=[[UIImageView alloc] initWithImage:_img];
    _imgView.userInteractionEnabled=YES;
    UITapGestureRecognizer *_imgViewgest=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mycallback)];
    [_imgView addGestureRecognizer:_imgViewgest];
    
    [containView addSubview:_imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(containView);
        make.height.equalTo(containView);
        make.left.equalTo(containView);
        make.top.equalTo(containView);

    }];
    
    self.frame=CGRectMake(0, 0, kDEVICEWIDTH, kDEVICEHEIGHT);
    [self addSubview:boxView];
}

-(void)hide{
    [UIView beginAnimations:@"hide" context:nil];
    [UIView setAnimationDelay:0];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:myObj];
    //设置翻转
    //    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    self.alpha=0;
    //   myADSlideView.frame=CGRectMake(0, kDEVICEHEIGHT, kDEVICEWIDTH, kDEVICEHEIGHT);
    [UIView commitAnimations];
}

-(void)mycallback{
    [self hide];
    callbackBlock();
}

@end
