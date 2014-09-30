#import <UIKit/UIKit.h>

@interface TabPagerViewController : UIPageViewController<UITabBarDelegate,UIPageViewControllerDataSource,UIPageViewControllerDelegate,UIScrollViewDelegate>

@end

@protocol TabPagerViewControllerChild <NSObject>

@property (nonatomic) NSInteger pageIndex;

@end
