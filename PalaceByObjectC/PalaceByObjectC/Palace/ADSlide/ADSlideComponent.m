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
    id myObj;
}
@end

@implementation ADSlideComponent

- (instancetype)initWithObj:(id)obj
{
    self = [super init];
    if (self) {
        myObj=obj;
        [self createADSlideIn:obj];
    }
    return self;
}

-(void)createADSlideIn:(id)obj{
    UIView *boxView=[[UIView alloc] init];
    boxView.frame=CGRectMake(0, 0, kDEVICEWIDTH, kDEVICEHEIGHT);
    boxView.backgroundColor=[UIColor clearColor];
    
    UIView *bgColor=[[UIView alloc] init];
    bgColor.frame=CGRectMake(0, 0, kDEVICEWIDTH, kDEVICEHEIGHT);
    bgColor.backgroundColor=RGBAlphaColor(0, 0, 0, 0.3);
    bgColor.userInteractionEnabled=YES;
    UITapGestureRecognizer *gest=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [bgColor addGestureRecognizer:gest];
    [boxView addSubview:bgColor];
    
    UIView *containView=[[UIView alloc] init];
    containView.backgroundColor=[UIColor whiteColor];
    [boxView addSubview:containView];
    [containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(boxView);
        make.centerY.equalTo(boxView);
        make.height.equalTo(@(kDEVICEHEIGHT/2));
        make.width.equalTo(@(kDEVICEWIDTH/5*4));
    }];
    containView.layer.borderWidth=1;
    containView.layer.borderColor=[UIColor blackColor].CGColor;
    
    UIButton *x=[UIButton buttonWithType:UIButtonTypeCustom];
    x.backgroundColor=[UIColor redColor];
    [x addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [boxView addSubview:x];
    [x setTitle:@"x" forState:UIControlStateNormal];
    [x mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(containView.mas_top);
        make.left.equalTo(containView.mas_right);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
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

@end
