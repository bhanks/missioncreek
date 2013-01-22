class Page < ActiveRecord::Base
  attr_accessible :body, :display_order, :title

  def formatted_body
  	RedCloth.new(self.body).to_html
  	


  end
  
end
