require 'rails_helper'

RSpec.describe Student, type: :model do

  before :each do 
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @longbottom = Student.create(name: "Neville Longbottom" , age: 13 , house: "Gryffindor" )
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    ProfessorStudent.create(student_id: @harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: snape.id)
  end 

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end
 
  describe 'instance methods' do 
    describe '#professor_count' do 
      it 'counts the number of professors a student has' do 
        expect(@harry.professor_count).to eq(2)
        expect(@longbottom.professor_count).to eq(1)
        
      end 
    end 
  end 

  describe 'class methods' do 
    describe '.average_age' do 
      it 'returns the average age of all students' do 
        expect(Student.average_age).to eq(12)
      end 
    end 

    describe '.alphabetical_students' do 
      it 'orders students being returned alphabetically' do 
        expect(Student.all).to eq([@longbottom, @harry])
        expect(Student.alphabetical_students).to eq([@harry, @longbottom])
      end 
    end 
  end 
end
