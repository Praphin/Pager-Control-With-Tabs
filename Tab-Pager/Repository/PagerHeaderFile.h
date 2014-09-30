#import "TabPagerViewController.h"
@interface TabPagerViewController () <UIPageViewControllerDataSource>
- (NSArray *)pageIdentifiers;

- (void)setUpViewController:(UIViewController<TabPagerViewControllerChild> *)viewController
                    atIndex:(NSInteger)index __attribute((objc_requires_super));

- (UIViewController *)viewControllerAtIndex:(NSInteger)index;

@end
