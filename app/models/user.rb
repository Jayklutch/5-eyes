class User < ActiveRecord::Base
  has_many :blinks
validates :username, uniqueness: true


  def self.authenticate(user, pword)
    test = User.find_by(username: user)
    unless test.nil?
      if pword == test.password
        return test
      else
        return nil
      end
    end
  end
end
