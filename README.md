# iodine

A MVVM framework based on ReactiveCocoa and built with a goal to sepparate untestable UIKit view logic from testable business logic.

## How does it work?

Well it's pretty simple:

* We create a new Model class:
```
@interface MYViewModel : IOTableViewModel
```
* We subclass any of the IO view controllers:
```
@interface MYViewController : IOTableViewController
```
* Then we implement the binding methods:
```
- (void)pre
{
	[super pre];
	
	//This is where all the things prior to initializing the view go. 
    //For example:
	[self rac_signalForSelector:@selector(scrollViewDidScroll:) 
				   fromProtocol:@protocol(UIScrollViewDelegate)];
}

- (void)setupViews
{
    [super setupViews];
    
    //Here we set up our view like we do on viewDidLoad. For example:
    [self.view addSubview:self.doneButton];
}

- (void)post
{
    [super post];
    
    //After we setup the views, we want to bind our view model against 
    //them, this is where all that magic goes. For example:
    RAC(self.doneButton, userInteractionEnabled) = 
         RACObserve(self.viewModel, doneEnabled);
}
```
* Now just instantiate your view controller with the model and you're done:
```
MYViewModel *vm = [[MYViewModel alloc] init];
MYViewController *vc = [[MYViewController alloc] initWithViewModel:vm];
```

## Okay, now can I get a real example?

[rprtr](https://github.com/delanoir/rprtr) should be a good resource, this project was developed against it.

## What about installing the framework?

You can build it as a regular framework, but I recommend using [CocoaPods](http://cocoapods.org):

```
pod 'iodine'
```

## Currently supported UIKit classes

* UIViewController (IOViewController)
* UITableViewController (IOTableViewController)
* UITableHeaderFooterView (IOTableHeaderFooterView)
* UITableViewCell (IOTableViewCell)