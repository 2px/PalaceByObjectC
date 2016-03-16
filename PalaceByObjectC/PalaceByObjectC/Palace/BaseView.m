//
//  BaseView.m
//  PalaceByObjectC
//
//  Created by 陈梦楼 on 16/3/16.
//  Copyright © 2016年 chenmenglou. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initBaseViewNav];
}

-(void)initBaseViewNav{
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBarHidden=YES;
    
    BaseViewNav=[[UIView alloc] init];
    BaseViewNav.backgroundColor=[UIColor redColor];
    BaseViewNav.userInteractionEnabled=YES;
    [self.view addSubview:BaseViewNav];
    [BaseViewNav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(@(kDEVICEHEIGHT));
        make.height.equalTo(@64);
    }];
    
    NavTitle=[[UILabel alloc] init];
    NavTitle.font=[UIFont systemFontOfSize:16];
    NavTitle.textColor=[UIColor whiteColor];
    NavTitle.textAlignment=NSTextAlignmentCenter;
    NavTitle.adjustsFontSizeToFitWidth=YES;
    [BaseViewNav addSubview:NavTitle];
    [NavTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(BaseViewNav);
        make.top.equalTo(BaseViewNav).with.offset(10);
        make.height.equalTo(@64);
        make.width.equalTo(@(kDEVICEWIDTH));
    }];
    
    BackBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [BaseViewNav addSubview:BackBtn];
    BackBtn.backgroundColor=[UIColor blackColor];
    BackBtn.hidden=YES;
    [BackBtn addTarget:self action:@selector(backBarClick) forControlEvents:UIControlEventTouchUpInside];
    [BackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(BaseViewNav).with.offset(10);
        make.top.equalTo(BaseViewNav).with.offset(25);
        make.width.equalTo(@(25));
        make.height.equalTo(@(25));
    }];
    
}

-(void)withBackbuttonAndSetNavTitle:(NSString*)title{
    [self setNavTitle:title];
    [self setBackButton];
}


-(void)setNavTitle:(NSString*)title{
    NavTitle.text=title;
}

-(void)setBackButton{
    BackBtn.hidden=NO;
}

-(void)backBarClick{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
