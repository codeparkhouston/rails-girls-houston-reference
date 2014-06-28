class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body

  mount_uploader :attachment, ImageUploader
end
