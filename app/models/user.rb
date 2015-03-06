class User < ActiveRecord::Base
  has_many :blinks
  validates :username, uniqueness: true
  validate :country

  def country
    countries = []
    File.open('friends.txt').each do |line|
      countries << line.chomp
    end
    if !countries.include?(username)
      errors.add(:username, "must be a country")
    end
  end

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
