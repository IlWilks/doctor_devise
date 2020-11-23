class PatientsController < ApplicationController
  #before_action :set_patient, only: [:show, :destroy]
  
    def index
      @patients = Patient.all
    end
  
    def show
      @patient = Patient.find(params[:id])
    end
  
    def new
      @patient = Patient.new
    end
  
    def create
      @patient = Patient.new(patient_params)
      if @patient.save
        redirect_to @patient
      else
        render :new
      end
    end
  
    def destroy
      @patient = Patient.find(params[:id])
      @patient.destroy
      redirect_to patients_path 
    end
  
    private

    def patient_params
      params.require(:patient).permit(:first_name, :last_name)
    end
  end