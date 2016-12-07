class Point < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :label, presence: true

  after_save :sum_points
  after_update :sum_points
    def sum_points


    user = User.find(self.user_id)
    # @users.sum(:goal_ydt)
    user.count_points = Point.where(user_id: self.user_id).calculate(:sum,:value)
    # user.count_points = user.points.sum(:value)
    user.save
  end


end
