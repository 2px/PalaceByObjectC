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
    self.view.backgroundColor=[UIColor whiteColor];
    __weak  ADSlide*__self=self;
    UIView *myADSlideView=[[ADSlideComponent alloc] initWithObj:self andImageIs:@"u=357512142,3071391448&fm=21&gp=0.jpg" andCallbackIs:^{
        [__self.navigationController popViewControllerAnimated:YES];
    }];
    [self.view addSubview:myADSlideView];
}

-(void)dealloc{
    NSLog(@"dealloc");
}

-(void)viewWillDisappear:(BOOL)animated{
    
}

@end
