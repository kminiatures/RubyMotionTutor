class AlphabetController < UIViewController
  def viewDidLoad
    super

    self.title = "Alphabet"
    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview @table

    @table.dataSource = self
    @table.delegate = self
    @data = ("A".."Z").to_a
  end

  # return the UITableViewCell for the row
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER" # セルの種類ごとにしるしをつける
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      # queue から取得できなければ、作る
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end
    cell.textLabel.text = @data[indexPath.row] # 行に data からラベルを設定
    cell # put your data in the cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count # return the number of rows
  end

  # タップされれば呼ばれる
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    # タップされると行が青くなるのを解除 ( deselect ) 
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    alert = UIAlertView.alloc.init
    alert.message = "#{@data[indexPath.row]} tapped!"
    alert.addButtonWithTitle "OK"
    alert.show
  end
end
