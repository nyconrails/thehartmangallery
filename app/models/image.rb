class Image < ActiveRecord::Base
  belongs_to :item
  attr_accessible :item_id, :file_file_name, :file_content_type, :file_file_size, :file_updated_at, :file
  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "150x150>" }
end
