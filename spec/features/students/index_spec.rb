require 'rails_helper'

RSpec.describe 'The students index' do 
    before :each do 
        @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
        @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
        harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
        longbottom = Student.create(name: "Neville Longbottom" , age: 13 , house: "Gryffindor" )
        ProfessorStudent.create(student_id: harry.id, professor_id: @snape.id)
        ProfessorStudent.create(student_id: harry.id, professor_id: @hagarid.id)
        ProfessorStudent.create(student_id: longbottom.id, professor_id: @snape.id)
    end 

    it 'lists the name of each student' do 
        visit "/professors/#{@snape.id}"
        expect(page).to have_content("Harry Potter")
        expect(page).to have_content("Neville Longbottom")
    end 

    it 'lists the number of professors each student has' do 
        visit "/professors/#{@snape.id}"
        expect(page).to have_content(2)
        expect(page).to have_content(1)
    end 

end 