class Like < ActiveRecord::Base
  belongs_to :books
  belongs_to :users

end
