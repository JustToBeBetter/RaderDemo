//
//  Rader.m
//  RaderDemo
//
//  Created by 李金柱 on 15/12/4.
//  Copyright © 2015年 Mr.Li. All rights reserved.
//

#import "Rader.h"

#define RADER_DISTANCE     (15)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation Rader
{
    NSTimer *_timer;//定时器
    NSInteger _count;//定时器计数
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}
- (void)initView

{
    
    self.backgroundColor = [UIColor clearColor];
    
}
- (void)animate:(BOOL)animate{
    if (animate) {
        if (!_timer) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                      target:self selector:@selector(redraw) userInfo:nil repeats:YES];
        }else{
            [_timer invalidate];
            _timer = nil;
            
        }
    }
}

- (void)redraw{
    _count++;
    _count = _count % RADER_DISTANCE;
    [self setNeedsDisplayInRect:self.frame];
}


//重写重绘方法

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawCircle:context];
    
}


//画圆

-(void)drawCircle:(CGContextRef)context

{
    
    //定义四个半径，
    
    //第一个圆的半径为RADIUS_DISTANCE，变化范围为RADIUS_DISTANCE到RADIUS_DISTANCE+_count;
    
    //第二个圆的半径为RADIUS_DISTANCE*2，变化范围为RADIUS_DISTANCE*2到RADIUS_DISTANCE*2+_count;
    
    //第三个圆的半径为RADIUS_DISTANCE*3，变化范围为RADIUS_DISTANCE*3到RADIUS_DISTANCE*3+_count;
    
    //第四个圆的半径为RADIUS_DISTANCE*4，变化范围为RADIUS_DISTANCE*4到RADIUS_DISTANCE*4+_count;
    
    CGPoint center = self.center;
    
    float radius0 = RADER_DISTANCE*1 + _count;
    
    float radius1 = RADER_DISTANCE*2 + _count;
    
    float radius2 = RADER_DISTANCE*3 + _count;
    
    float radius3 = RADER_DISTANCE*4 + _count;
    
    //    CG_EXTERN void CGContextSetRGBStrokeColor(CGContextRef __nullable c,
    //                                              CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
    //    CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);
    
    //绘制第一个圆
    
    //设置颜色为(255,100,100),透明度根据timer计数器计算，范围从1变化至0.7
    
    CGContextSetRGBStrokeColor(context, 255, 100, 100, 0.7 + 0.3*(RADER_DISTANCE-_count)/RADER_DISTANCE);
    
    //宽度范围由2变化至3
    //CG_EXTERN void CGContextSetLineWidth(CGContextRef __nullable c, CGFloat width)
    
    
    
    CGContextSetLineWidth(context, 2.0 + 1*_count/RADER_DISTANCE);
    
    //绘制
    
    CGContextAddEllipseInRect(context, CGRectMake(center.x - radius0, center.y - radius0, 2*radius0, 2*radius0));
    
    CGContextStrokePath(context);
    
    
    //绘制第二个圆
    
    //设置颜色为(255,100,100),透明度根据timer计数器计算，范围从0.7变化至0.4
    
    CGContextSetRGBStrokeColor(context, 255, 100, 100, 0.4 + 0.3*(RADER_DISTANCE-_count)/RADER_DISTANCE);
    
    //宽度范围由3变化至4
    
    CGContextSetLineWidth(context, 3.0 + 1*_count/RADER_DISTANCE);
    
    CGContextAddEllipseInRect(context, CGRectMake(center.x - radius1, center.y - radius1, 2*radius1, 2*radius1));
    
    CGContextStrokePath(context);
    
    
    
    //绘制第三个圆
    
    //设置颜色为(255,100,100),透明度根据timer计数器计算，范围从0.4变化至0.2
    
    CGContextSetRGBStrokeColor(context, 255, 100, 100, 0.2 + 0.2*(RADER_DISTANCE-_count)/RADER_DISTANCE);
    
    //宽度范围由4变化至5
    
    CGContextSetLineWidth(context, 4.0 + 1*_count/RADER_DISTANCE);
    
    CGContextAddEllipseInRect(context, CGRectMake(center.x - radius2, center.y - radius2, 2*radius2, 2*radius2));
    
    CGContextStrokePath(context);
    
    
    
    //绘制第四个圆
    
    //设置颜色为(255,100,100),透明度根据timer计数器计算，范围从0.2变化至0
    
    CGContextSetRGBStrokeColor(context, 255, 100, 100, 0.0 + 0.2*(RADER_DISTANCE-_count)/RADER_DISTANCE);
    
    //宽度范围由5变化至6
    
    CGContextSetLineWidth(context, 5.0 + 1*_count/RADER_DISTANCE);
    
    CGContextAddEllipseInRect(context, CGRectMake(center.x - radius3, center.y - radius3, 2*radius3, 2*radius3));
    
    CGContextStrokePath(context);
    
}
-(void)layoutSubviews{
    
    UIView * background=[[UIView alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    background.backgroundColor=[UIColor blackColor];
    [self addSubview:background];
}

@end
