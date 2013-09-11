require_relative '../../db/config'

class Student < ActiveRecord::Base

  def name 
    first_name + " " + last_name
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year
  end
end
