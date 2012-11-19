class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :up, :user_id, :link_id
  belongs_to :user
  belongs_to :link 

  # Specify that new votes can only be saved if the user_id 
  # and link_id combo haven't been used before.
  validates :user_id, :uniqueness => { :scope => :link_id }

end
