class Post < ActiveRecord::Base

  belongs_to :user


  def email_name
    Post.user.email.split("@").capitalize
  end


end
