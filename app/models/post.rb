class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :body

  def parsed_body
    body = self.body
    name = self.body.split('[').last.split(']').first
    user = User.where(name: name).first
    if user.present?
      user_tag = "<a href='/users/#{user.id}'>#{name}</a>"
      body = body.gsub("[#{name}]", user_tag)
      body = body.html_safe
    end
    body
  end
end