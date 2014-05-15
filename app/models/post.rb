class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body

  def parsed_body
    body = self.body

    # Example: "Hey [Joe], what are you up to these days?"
    # Split the body by the first bracket, then take the last part of the split (.last)
    # Split that last part by the closing bracket, and take the content before that (.first)
    name = body.split('[').last.split(']').first
    
    # Look up the parsed name in the database
    user = User.where(name: name).first

    # If the user is found
    if user.present?
      # Create an html link to link to the user's page
      user_tag = "<a href='/users/#{user.id}'>#{name}</a>"

      # Replace the original name (like [Joe]) with the created html link
      body = body.gsub("[#{name}]", user_tag)

      # Ensure the body is valid and safe html by calling html_safe
      body = body.html_safe
    end

    # Return the body
    body
  end
end
