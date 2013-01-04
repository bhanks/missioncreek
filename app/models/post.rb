class Post < ActiveRecord::Base
  attr_accessible :body, :title

  def date
  	self.created_at.strftime("%m/%d/%y")
  end

end
