//
//  UIImageView+Web.m
//  JXImageView
//
//  Created by Jep Xia on 2018/4/1.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "UIImageView+Web.h"

@implementation UIImageView (Web)
-(void)jx_setImageWithURL:(NSURL *)url
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        //并行执行图片的数据处理
        NSData *data = [NSData new];
        data = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //主线程
            self.image = [UIImage imageWithData:data];
        });
    });
}
@end
