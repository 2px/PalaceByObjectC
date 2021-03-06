//
//  ADSlideComponent.h
//  PalaceByObjectC
//
//  Created by 陈梦楼 on 16/3/10.
//  Copyright © 2016年 chenmenglou. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ADSlideComponentBlcok)();

@interface ADSlideComponent : UIView

- (instancetype)initWithObj:(id)obj
                 andImageIs:(NSString*)img
              andCallbackIs:(ADSlideComponentBlcok)b;

@end
