require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :uniqueness => true
  validates :age, :numericality => true 
  validates :age, :numericality => { :greater_than => 5} 
  validates :email, :format => { :with => /\S+@\S+\.\S{2,}/, 
      :message => "Nah nah nah nah nah"}
  validates :phone, :format => { :with => /\(\d{3}\)\s\d{3}-\d{4}\sx\d{4}/, 
      :message => "That's not a phone number, you fool!"}

  def name 
    first_name + " " + last_name
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year
  end
end
