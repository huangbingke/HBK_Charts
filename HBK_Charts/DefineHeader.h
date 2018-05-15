//
//  DefineHeader.h
//  HBK_Charts
//
//  Created by 黄冰珂 on 2018/4/23.
//  Copyright © 2018年 KK. All rights reserved.
//

#ifndef DefineHeader_h
#define DefineHeader_h

//屏幕的宽度
#define kScreenWidth            [[UIScreen mainScreen] bounds].size.width

//屏幕的高度
#define kScreenHeight           [[UIScreen mainScreen] bounds].size.height


//导航栏高度
#define kNavBarHeight           (kScreenHeight == 812 ? 88 : 64)

//状态栏高度
#define kStatusHeight           (kScreenHeight == 812 ? 44 : 20)

//如果是iPhone X就返回44, 否则就0
#define kFringeHeitht           (kScreenHeight == 812 ? 44 : 0)


//tabBar高度
#define kTabBarHeight           (kScreenHeight == 812 ? 83 : 49)

//NavigationBar和TabBar的高度
#define kNBarTBarHeight         (kNavBarHeight + kTabBarHeight)

//如果是iPhoneX 底部留空隙34, 如果不是空隙为0
#define kIPhoneXBottomHeight    (kScreenHeight == 812 ? 34 : 0)

#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



// 形象进度颜色值
#define kCompleteColor UIColorFromRGBValue(0X43D136)
#define kWorkingColor  UIColorFromRGBValue(0XFFB359)
#define kOverTimeColor UIColorFromRGBValue(0XFF5247)
#define kNotStartColor UIColorFromRGBValue(0XEEEEEE)
#define kTipsLabelColor UIColorFromRGBValue(0XCCCCCC)


#endif /* DefineHeader_h */
