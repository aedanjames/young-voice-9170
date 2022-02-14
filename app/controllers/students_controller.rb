class StudentsController < ApplicationController 

    def index 
        # Is it better to call alphabetical_students here or in view?
        @students = Student.alphabetical_students
    end 
end 