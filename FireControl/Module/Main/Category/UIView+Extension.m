

#import "UIView+Extension.h"
#import <objc/runtime.h>

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)bottomFromSuperView{
    return self.superview.height - self.y - self.height;
}

#pragma mark - badge

static char badgeViewKey;
static NSInteger const pointWidth = 6; //小红点的宽高
static NSInteger const rightRange = 2; //距离控件右边的距离
static CGFloat const badgeFont = 9; //字体的大小

- (void)showBadge
{
    if (self.badge == nil) {
        CGRect frame = CGRectMake(CGRectGetWidth(self.frame) + rightRange, -pointWidth / 2, pointWidth, pointWidth);
        self.badge = [[UILabel alloc] initWithFrame:frame];
        self.badge.backgroundColor = [UIColor redColor];
        //圆角为宽度的一半
        self.badge.layer.cornerRadius = pointWidth / 2;
        //确保可以有圆角
        self.badge.layer.masksToBounds = YES;
        [self addSubview:self.badge];
        [self bringSubviewToFront:self.badge];
    }
}

- (void)showBadgeWithCount:(NSInteger)redCount
{
    if (redCount < 0) {
        return;
    }
    [self showBadge];
    self.badge.textColor = [UIColor whiteColor];
    self.badge.font = [UIFont systemFontOfSize:badgeFont];
    self.badge.textAlignment = NSTextAlignmentCenter;
    self.badge.text = (redCount > 99 ? [NSString stringWithFormat:@"99+"] : [NSString stringWithFormat:@"%@", @(redCount)]);
    [self.badge sizeToFit];
    CGRect frame = self.badge.frame;
    frame.size.width += 4;
    frame.size.height += 4;
    frame.origin.y = -frame.size.height / 2;
    if (CGRectGetWidth(frame) < CGRectGetHeight(frame)) {
        frame.size.width = CGRectGetHeight(frame);
    }
    self.badge.frame = frame;
    self.badge.layer.cornerRadius = CGRectGetHeight(self.badge.frame) / 2;
}

- (void)hidenBadge
{
    //从父视图上面移除
    [self.badge removeFromSuperview];
}

#pragma mark - GetterAndSetter

- (UILabel *)badge
{
    //通过runtime创建一个UILabel的属性
    return objc_getAssociatedObject(self, &badgeViewKey);
}

- (void)setBadge:(UILabel *)badge
{
    objc_setAssociatedObject(self, &badgeViewKey, badge, OBJC_ASSOCIATION_RETAIN);
}

// 实现文件
- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    // 栅格化 - 提高性能
    // 设置栅格化后，图层会被渲染成图片，并且缓存，再次使用时，不会重新渲染
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}


@end
