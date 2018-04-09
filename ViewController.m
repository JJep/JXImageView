//
//  ViewController.m
//  JXImageView
//
//  Created by Jep Xia on 2018/4/1.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+Web.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    NSMutableArray *dataAry = [NSMutableArray new];
    NSURL *u1 = [NSURL URLWithString:@"http://www.windows7en.com/uploads/140829/2009120309142160.jpg"];
    NSURL *u2 = [NSURL URLWithString:@"https://tse3-mm.cn.bing.net/th?id=OIP.dhB7nSlblzW7T3sfNeeTLAHaEK&p=0&o=5&pid=1.1"];
    NSURL *u3 = [NSURL URLWithString:@"https://tse2-mm.cn.bing.net/th?id=OIP.C6uUnA27enUzMpNmgyQTdwHaEK&pid=15.1"];
    NSURL *u4 = [NSURL URLWithString:@"http://pic1.win4000.com/wallpaper/e/508518a4ae8e1.jpg"];
    [dataAry addObject:u1];
    [dataAry addObject:u2];
    [dataAry addObject:u3];
    [dataAry addObject:u4];
    
    //遍历数组的同时完成对UIImageView的创建
    [dataAry enumerateObjectsUsingBlock:
     ^(NSURL *url, NSUInteger idx, BOOL * _Nonnull stop) {
         CGFloat width = self.view.frame.size.width - 40;
         CGFloat height = (self.view.frame.size.height - 5 * 20) /4;
         UIImageView *imageView = [UIImageView new];
         [imageView setFrame:CGRectMake(20, 20*(idx+1) + height* idx, width, height)];
         [imageView jx_setImageWithURL:url]; //异步加载
//         [imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:url]]];//系统自带方法
         [imageView setBackgroundColor:[UIColor orangeColor]];
         [self.view addSubview:imageView];
     }];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
