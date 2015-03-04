class User < ActiveRecord::Base
  has_many :blinks
  # Remember to create a migration!
end
