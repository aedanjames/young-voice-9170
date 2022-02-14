class StudentsController < ApplicationController 

    def index 
        @students = Professor.all
    end 