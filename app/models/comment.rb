class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post


  def user_name
    self.user.username
  end

  def user_attributes=(user_hash)
    unless user_hash[:username] == ""
      user = User.create(user_hash)
      self.user_id = user.id
    end
  end
end
