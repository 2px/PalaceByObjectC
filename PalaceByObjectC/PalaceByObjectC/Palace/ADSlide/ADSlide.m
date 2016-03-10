//
//  ADSlide.m
//  PalaceByObjectC
//
//  Created by 陈梦楼 on 16/3/10.
//  Copyright © 2016年 chenmenglou. All rights reserved.
//

#import "ADSlide.h"
#import "ADSlideComponent.h"

@implementation ADSlide

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"ADSlide"];
    UIView *myADSlideView=[[ADSlideComponent alloc] initWithObj:self];
    [self.view addSubview:myADSlideView];
}

@end
