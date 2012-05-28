class Admin::ImagesController < Admin::ApplicationController
  inherit_resources
  protect_from_forgery
  belongs_to :item
  
end
