

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign, readonly) CGFloat bottomFromSuperView;


/**  通过创建label，显示小红点；*/
@property (nonatomic, strong) UILabel *badge;

/** 显示小红点 */
- (void)showBadge;

/**
 * 显示小红点儿的数字
 * parameter redCount 小红点儿数字
 */
- (void)showBadgeWithCount:(NSInteger)redCount;

/** 隐藏小红点*/
- (void)hidenBadge;


/// 边线颜色
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
/// 边线宽度
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
/// 圆角半径
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@end
