//
//  BaseView.h
//  PalaceByObjectC
//
//  Created by 陈梦楼 on 16/3/16.
//  Copyright © 2016年 chenmenglou. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseView : UIViewController
{
    UIView *BaseViewNav;
    UILabel *NavTitle;
    UIButton *BackBtn;
}

-(void)withBackbuttonAndSetNavTitle:(NSString*)title;
-(void)setNavTitle:(NSString*)title;
-(void)setBackButton;
-(void)backBarClick;
@end
