class Message < ApplicationRecord
  belongs_to :user

  def timestamp
    self.created_at.strftime("%-m/%-d/%y %l:%M %P")
  end

  def username
    self.user.username
  end
end
