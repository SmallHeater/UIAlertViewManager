//
//  UIAlertViewManager.h
//  UIAlertViewManager
//
//  Created by xianjunwang on 2017/8/21.
//  Copyright © 2017年 xianjunwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIAlertViewManager : NSObject
//添加要显示的view到数组中(可接收 UIView,UIAlertView,UIActionSheet,UIAlertController类型)
-(void)addView:(id)showView;
//从数组中移除以显示完成并消失的view
-(void)deleteView:(id)showView;
@end
