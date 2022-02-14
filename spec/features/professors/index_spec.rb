require 'rails_helper'

RSpec.describe 'The professors index' do 
    before :each do 
        @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
        @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
        @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
    end 
    it 'lists all professors and their attributes' do 
        visit '/professors'
        expect(page).to have_content("Severus Snape")
        expect(page).to have_content("45")
        expect(page).to have_content("Potions")
        expect(page).to have_content("Rubeus Hagrid")
        expect(page).to have_content("38")
        expect(page).to have_content("Care of Magical Creatures")
        expect(page).to have_content("Remus Lupin")
        expect(page).to have_content("49")
        expect(page).to have_content("Defense Against The Dark Arts")
    end
end