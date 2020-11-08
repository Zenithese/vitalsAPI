class Api::MeasurementsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]

  def index
    @measurements = Measurement.all
  end

  def show
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
  end

  def edit
  end

  def create
    @measurement = Measurement.new(measurement_params)

    respond_to do |format|
      if @measurement.save
        render :show
      else
        render json: @comment.errors.full_messages, status: 422
      end
    end
  end

  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to @measurement, notice: 'Measurement was successfully updated.' }
        format.json { render :show, status: :ok, location: @measurement }
      else
        format.html { render :edit }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to measurements_url, notice: 'Measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    def measurement_params
      params.require(:measurement).permit(:temperature, :blood, :oximeter_spo2, :oximeter_pr)
    end
end
