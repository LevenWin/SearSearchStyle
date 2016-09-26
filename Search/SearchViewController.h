//
//  SearchViewController.h
//  Search
//
//  Created by 吴狄 on 16/9/6.
//  Copyright © 2016年 Leven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
@property (nonatomic,retain)UIImageView *bgImg;
@property (nonatomic,copy)void(^searchClick)(NSString *text);
@end
