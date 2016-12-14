

#import "RootViewController.h"
#import "RootView.h"
@interface RootViewController ()
@property (retain, nonatomic) RootView * rv;
@end

@implementation RootViewController
- (void)dealloc
{
    [_rv release];
    [super dealloc];
}
- (void)loadView
{
    self.rv = [[[RootView alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease];
    self.view = self.rv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
