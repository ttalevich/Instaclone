class Post < ApplicationRecord
	belongs_to :user
	has_attached_file :image, styles: { medium: ">500x500>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	# @post.user = current_user
end
