class User < ActiveRecord::Base
  attr_accessible :password, :username

  def followers
    0
  end
end
