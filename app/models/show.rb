class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters

  def actors_list
    self.characters.map {|character| character.actor.full_name}
  end

  def build_network(call_letters:)
    self.network = Network.new(call_letters: call_letters)
  end

end
