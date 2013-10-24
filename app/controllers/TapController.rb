class TapController < UIViewController
  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.redColor

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = 'Taps'
    @label.sizeToFit
    @label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
    self.view.addSubview @label

    self.title = "Tap (#{self.navigationController.viewControllers.count})"

    right_button = UIBarButtonItem.alloc.initWithTitle(
      '押せ', 
      style: UIBarButtonItemStyleBordered, 
      target: self, 
      action: 'push')
    self.navigationItem.rightBarButtonItem = right_button

  end

  def push
    puts "押した!!!!!!!!!!!!!!!!!!!!"
    c = TapController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(c, animated: true)
  end
end
