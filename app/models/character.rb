class Character < ActiveRecord::Base
  belongs_to :actor
  belongs_to :show

  def say_that_thing_you_say
    "#{self.name} always says: #{self.catchphrase}"
  end

  def build_show(name:)
    self.show = Show.new(name: name)
  end

  def build_network(call_letters:)
    self.show = Network.new(call_letters: call_letters)
  end

end

it "can build its associated show" do
  jules_cobb = Character.new(name: "Jules Cobb")
  jules_cobb.build_show(name: "Cougar Town")
  expect(jules_cobb.show.name).to eq("Cougar Town")
end

it "can chain-build associations to which it belongs" do
  malcolm = Character.new(name: "Malcolm Reynolds")
  malcolm.build_show(name: "Firefly").build_network(:call_letters => "Fox")
  show = malcolm.show
  expect(show.name).to eq("Firefly")
  expect(show.network.call_letters).to eq("Fox")
end
