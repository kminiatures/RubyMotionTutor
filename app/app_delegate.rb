class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    puts 'なにこれ'

    # UIScreen describes the display our app is running on
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    controller = TapController.alloc.initWithNibName nil, bundle:nil
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(controller)

    # @blue_view = UIView.alloc.initWithFrame(CGRectMake(10, 10, 100, 100))
    # @blue_view.backgroundColor = UIColor.blueColor
    # @window.addSubview(@blue_view)

    # @ya = UIView.alloc.initWithFrame(CGRectMake(100,100,100,100))
    # @ya.backgroundColor = UIColor.greenColor

    # [@blue_view, @ya].each do|v|
      # @window.addSubview(v)
    # end
    
    true
  end
end
