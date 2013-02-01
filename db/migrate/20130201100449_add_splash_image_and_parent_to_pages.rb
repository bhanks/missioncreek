class AddSplashImageAndParentToPages < ActiveRecord::Migration
  def change
  	add_column :pages, :splash_image, :string
  	add_column :pages, :parent, :integer
  end
end
