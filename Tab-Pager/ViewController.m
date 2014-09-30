
#import "ViewController.h"


@implementation ViewController

+ (void)initialize {
    if (self == ViewController.class) {
        UIPageControl *pageControl = UIPageControl.appearance;
        pageControl.pageIndicatorTintColor = UIColor.blackColor;
        pageControl.currentPageIndicatorTintColor = UIColor.redColor;
        
        
    }
}

- (NSArray *)pageIdentifiers {
    return @[@"FirstView", @"SecondView", @"ThirdView", @"FourthTableView"];
}

@end
