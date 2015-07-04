class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @user=current_user
    @appointments = Appointment.all
    @departments= Department.all
    @doctors= Doctor.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @department=Department.find(params[:department])
    @doctors=Doctor.all
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @user=current_user
    @appointment = Appointment.new(appointment_params)
    @department=Department.all
    @doctor=Doctor.all

    if @appointment.schedule_later==false
      if @appointment.department_id== 1
        if Time.now.strftime("%H").to_i.between?(00,13)
          @appointment.time_of_appointment="3pm"
          @appointment.date_of_appointment=Date.today
        else
          @appointment.time_of_appointment= "10am"
          @appointment.date_of_appointment=Date.tomorrow
        end
      end

      if @appointment.department_id== 2
        if Time.now.strftime("%H").to_i.between?(00,13)
          @appointment.time_of_appointment="4pm"
          @appointment.date_of_appointment=Date.today
        else
          @appointment.time_of_appointment= "09am"
          @appointment.date_of_appointment=Date.tomorrow
        end
      end

  else

    @ChkAvail=@appointment.doctor.available_on
    @ChkAvail.split(",")
    @day=@appointment.date_of_appointment.strftime("%A").to_s
    @day.downcase

    if @ChkAvail.include?(@day)
      flash.now[:notice] = 'Hurray doctor is available'
    else
      flash.now[:alert] = 'sorry doctor is not available'
    end
    if @appointment.department_id=1
      @appointment.time_of_appointment="10am"
    elsif @department.department_id== 2
      @appointment.time_of_appointment= "09am"
    end

end

    @appointment.email=@user.email

    respond_to do |format|
      AppointmentMailer.sample_email(@user,@appointment).deliver
          if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def home
   @departments =Department.all
  end
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:department_id, :doctor_id, :date_of_appointment,:time_of_appointment,:schedule_later)
    end
end
