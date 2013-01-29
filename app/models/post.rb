class Post < ActiveRecord::Base
  attr_accessible :body, :title

  def date
  	self.created_at.strftime("%m/%d/%y")
  end

  def formatted_body
  	RedCloth.new(self.body).to_html
  end


end
