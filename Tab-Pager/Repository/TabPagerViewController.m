
#import "TabPagerViewController.h"
#import "PagerHeaderFile.h"
#import "FirstViewController.h"


@interface TabPagerViewController (){
    UITabBar *Tab;
    UITabBarItem *TabItemTrack;
    UITabBarItem *TabItemPlan;
    UITabBarItem *TabItemMove;
    UITabBarItem *TabItemEat;

}

@end

@implementation TabPagerViewController


- (id)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style
        navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation
                      options:(NSDictionary *)options {
    if ((self = [super initWithTransitionStyle:style
                         navigationOrientation:navigationOrientation
                                       options:options])) {
        [self ms_setUp];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self ms_setUp];
    }
    
    return self;
}

#pragma mark - Protected

- (void)ms_setUp {
    self.dataSource = self;
    self.delegate=self;
    
}

- (NSArray *)pageIdentifiers {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (NSInteger)pageCount {
    
    NSLog(@"Page cccc");
    return (NSInteger)self.pageIdentifiers.count;
}

- (void)setUpViewController:(UIViewController<TabPagerViewControllerChild> *)viewController atIndex:(NSInteger)index {
    
    
}






- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    
    for (UIView *view in self.view.subviews ) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scroll = (UIScrollView *)view;
            scroll.delegate = self;
        }
    }
    
    
    UIView *mView=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    [self.view addSubview:mView];
    
    Tab=[[UITabBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    Tab.barTintColor=[UIColor redColor];
    Tab.tintColor=[UIColor whiteColor];
    
    TabItemTrack=[[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"icon"] tag:0];
    TabItemPlan=[[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"icon"] tag:1];
    TabItemMove=[[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"icon"] tag:2];
    TabItemEat=[[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"icon"] tag:3];
    
    
    
    NSArray *arr=[[NSArray alloc]initWithObjects:TabItemTrack,TabItemPlan,TabItemMove,TabItemEat,nil];
    Tab.delegate=self;
    
    
    Tab.items=arr;
    
    Tab.selectedItem=TabItemTrack;
    
    
    
    [mView addSubview:Tab];
    
    NSAssert(self.pageCount > 0, @"%@ has no pages", self);
    
    [self setViewControllers:@[[self viewControllerAtIndex:0]]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
    
    if (self.pageCount == 1) {
        self.view.userInteractionEnabled = NO;
    }
}



#pragma mark - UITabBarDelegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    if (item.tag==0) {
        Tab.barTintColor=[UIColor lightGrayColor];
        
        [self setViewControllers:@[[self viewControllerAtIndex:0]]
                       direction:UIPageViewControllerNavigationDirectionForward
                        animated:NO
                      completion:nil];
        
    }
    else if(item.tag==1){
        Tab.barTintColor=[UIColor blueColor];
        
        [self setViewControllers:@[[self viewControllerAtIndex:1]]
                       direction:UIPageViewControllerNavigationDirectionForward
                        animated:NO
                      completion:nil];
        
        
    }
    else if(item.tag==2){
        [self setViewControllers:@[[self viewControllerAtIndex:2]]
                       direction:UIPageViewControllerNavigationDirectionForward
                        animated:NO
                      completion:nil];
        Tab.barTintColor=[UIColor magentaColor];
        
        
    }
    
    else if(item.tag==3){
        Tab.barTintColor=[UIColor purpleColor];
        
        [self setViewControllers:@[[self viewControllerAtIndex:3]]
                       direction:UIPageViewControllerNavigationDirectionForward
                        animated:NO
                      completion:nil];
        
        
    }
    
    
    
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed;
{
    
    NSString *str=[NSString stringWithFormat:@"%@",self.viewControllers];
    NSLog(@"str didFinishAnimating %@",str);
    
    if ([str containsString:@"FirstViewController"]) {
        NSLog(@"");
        Tab.selectedItem=TabItemTrack;
        Tab.barTintColor=[UIColor lightGrayColor];
        
    }
    else if ([str containsString:@"SecondViewController"]) {
        NSLog(@"SecondViewController");
        Tab.selectedItem=TabItemPlan;
        Tab.barTintColor=[UIColor blueColor];
        
    }
    else if ([str containsString:@"ThirdViewController"]) {
        NSLog(@"ThirdTableViewController");
        Tab.selectedItem=TabItemMove;
        Tab.barTintColor=[UIColor magentaColor];
        
    }
    else if ([str containsString:@"FourthViewController"]) {
        NSLog(@"FFFFF");
        Tab.selectedItem=TabItemEat;
        Tab.barTintColor=[UIColor purpleColor];
        
    }
    else{
        NSLog(@"Nil");
        Tab.selectedItem=TabItemTrack;
        
    }
    
}



#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController<TabPagerViewControllerChild> *)viewController {
    const NSInteger index = viewController.pageIndex;
    
    
    return (index == NSNotFound) ? nil : [self viewControllerAtIndex:index - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController<TabPagerViewControllerChild> *)viewController {
    const NSInteger index = viewController.pageIndex;
    return (index == NSNotFound) ? nil : [self viewControllerAtIndex:index + 1];
}

- (UIViewController *)viewControllerAtIndex:(NSInteger)index  {
    UIViewController<TabPagerViewControllerChild> *result = nil;
    
    
    
    if (index >= 0 && index < self.pageCount) {
        NSAssert(self.storyboard,
                 @"This controller is only meant to be used inside of a UIStoryboard");
        
        result = [self.storyboard instantiateViewControllerWithIdentifier:self.pageIdentifiers[(NSUInteger)index]];
        
        NSParameterAssert(result);
        NSAssert([result conformsToProtocol:@protocol(TabPagerViewControllerChild)],
                 @"Child view controller (%@) must conform to %@",
                 result,
                 NSStringFromProtocol(@protocol(TabPagerViewControllerChild)));
        
        result.pageIndex = index;
        
        NSLog(@"Result %@",result);
        
        [self setUpViewController:result
                          atIndex:index];
    }
    
    
    
    return result;
}

- (NSInteger)presentationCountForPageViewController:(TabPagerViewController *)pageViewController {
    
    const BOOL shouldShowPageControl = (pageViewController.pageCount > 1);
    
    return (shouldShowPageControl) ? pageViewController.pageCount : 0;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    
    return [pageViewController.viewControllers.lastObject pageIndex];
}

@end
