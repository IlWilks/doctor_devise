class AppointmentsController < ApplicationController
  before_action before_action :set_patient, only: [:show, :destroy]
   
  
   def index
     @doctor = @patient.appointments 
   end
 
 def new 
   @doctor = @doctor.appointments.new
 end 
 
 def create 
   @doctor = @doctor.appointments.new(appointment_params)
   if @appointment.save
     redirect_to doctor_appointments_path(@doctor)
   else 
     render :new 
   end
 end
 
 def destroy
   @appointment = @doctor.appointments.find(params[:id])
   @appointment.destroy
   redirect_to doctor_appointments_path(@doctor)
 end
 
 private
   def set_patient
     @patient = Patient.find(params[:id])
   end
   
   def appointment_params
     params.require(:appointment).permit(:role, :patient_id)
   end
 end