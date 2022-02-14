class ProfessorsController < ApplicationController 

    def index 
        @professors = Professor.all
    end 

    def show
        @professor = Professor.find(params[:id])
        @professor_students_avg_age = @professor.students.average_age
    end 
end 