require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  before :each do 
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
  end 

  describe 'class methods' do
    describe '.alphebetical_professors' do 
      it 'returns all professors alphabetically' do 
        expect(Professor.all).to eq([@snape, @hagarid])
        expect(Professor.alphebetical_professors).to eq([@hagarid, @snape])
      end
    end 
  end
end
