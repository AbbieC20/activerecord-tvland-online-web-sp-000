class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    return "#{actors.first_name} #{actors.last_name}"
  end

end

# has associated characters in an array
# can build its associated characters
# can build its associated shows through its characters
# can list its full name
# can list all of its shows and characters
