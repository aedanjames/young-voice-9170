class StudentsController < ApplicationController 

    def index 
        @students = Student.alphabetical_students
    end 
end 