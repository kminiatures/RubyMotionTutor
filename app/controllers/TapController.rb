class TapController < UIViewController
  include BW::KVO

  attr_accessor :user

  def viewDidLoad
    super

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = 'Taps'
    @label.sizeToFit
    @label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
    self.view.addSubview @label
    self.title = "Tap (#{self.navigationController.viewControllers.count})"
    self.view.backgroundColor = UIColor.whiteColor
    self.navigationItem.rightBarButtonItem = right_button



    x = 10
    y = 100
    @name_label = UILabel.alloc.initWithFrame([[x, y], [100, 30]])
    self.view.addSubview(@name_label)

    y = y + @name_label.frame.size.height + 10
    @email_label = UILabel.alloc.initWithFrame([[x, y], @name_label.frame.size])
    self.view.addSubview(@email_label)

    y = @email_label.frame.origin.y + @email_label.frame.size.height + 10
    @id_label = UILabel.alloc.initWithFrame([[x, y], @name_label.frame.size])
    self.view.addSubview(@id_label)

    self.user = User.new

    ["name", "id", "email"].each { |prop|
      observe(self.user, prop) do |old_value, new_value|
        instance_variable_get("@#{prop}_label").text = new_value
      end
    }



    # アニメーション 移動地点
    @points = [[80, 80], [150, 380], [80, 130], [130, 130]]
    @color  = [UIColor.redColor, UIColor.greenColor, UIColor.blueColor, UIColor.whiteColor]
    @current_index = 0

    # 移動させる view を追加する
    @view = UIView.alloc.initWithFrame [@points[@current_index], [100, 100]]
    @view.backgroundColor = UIColor.blueColor
    self.view.addSubview(@view)

    animate_to_next_point
  end

  def add_label(frame)
  end

  def animate_to_next_point
    @current_index += 1
    @current_index = @current_index % @points.count # keep current_index in the range [0,3]

    duration = 1
    UIView.animateWithDuration(duration,
      delay: 1,
      options:UIViewAnimationOptionCurveEaseInOut,
      animations: lambda { 
        @view.frame = [@points[@current_index], [100, 100]] 
        @view.backgroundColor = @color[@current_index]
      },
      completion: lambda {|finished| self.animate_to_next_point }
    )
  end



  def right_button
    UIBarButtonItem.alloc.initWithTitle(
      '押せ', 
      style: UIBarButtonItemStyleBordered, 
      target: self, 
      action: 'push')
  end

  # viewDidLoad の right_button の action で指定されている
  def push
    # TapController を作って
    c = TapController.alloc.initWithNibName(nil, bundle: nil)
    # navigationController に 入れる
    self.navigationController.pushViewController(c, animated: true)
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemFavorites, tag:1)
    self
  end
end
