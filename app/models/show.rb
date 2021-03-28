class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters

  def actors_list
    self.shows.map {|actor| actor.name}
  end

end

# self.characters.map {|character| "#{character.name} - #{character.show.name}"}
