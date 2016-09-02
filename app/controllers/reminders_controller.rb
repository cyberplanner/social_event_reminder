class RemindersController < ApplicationController

  before_action :set_reminder, only: [:show, :edit, :update, :destroy]

  # GET /reminders
  # GET /reminders.json
  def index
    @event = Event.find(params[:event_id])
    @reminders = @event.reminders.all
  end

  # GET /reminders/1
  # GET /reminders/1.json
  def show

  end

  # GET /reminders/new
  def new
    @reminder = Reminder.new
    @event = Event.find(params[:event_id])
  end

  # GET /reminders/1/edit
  def edit
  end

  # POST /reminders
  # POST /reminders.json
  def create
    Time.zone = reminder_params[:time_zone]
    @event = Event.find(params[:event_id])
    @reminder = @event.reminders.new(reminder_params)

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to event_reminders_path(@event), notice: 'Reminder was successfully created.' }
        format.json { render :show, status: :created, location: @reminder }
      else
        format.html { render :new }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminders/1
  # PATCH/PUT /reminders/1.json
  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to @reminder, notice: 'Reminder was successfully updated.' }
        format.json { render :show, status: :ok, location: @reminder }
      else
        format.html { render :edit }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1
  # DELETE /reminders/1.json
  def destroy
    @reminder.destroy
    respond_to do |format|
      format.html { redirect_to reminders_url, notice: 'Reminder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reminder_params
      params.require(:reminder).permit(:name, :phone_number, :time, :time_zone, :event_id)
    end
end
