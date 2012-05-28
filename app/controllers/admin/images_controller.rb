class Admin::ImagesController < Admin::ApplicationController
  inherit_resources
  protect_from_forgery
  belongs_to :item
  
  def create
    create!{admin_item_images_path}
  end
  
end