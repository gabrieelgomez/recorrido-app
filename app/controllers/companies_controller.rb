class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy shifts]
  before_action :set_service_session, only: %i[shifts]

  # GET /companies or /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1 or /companies/1.json
  def show; end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit; end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_url(@company), notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def shifts
    @service = @company.services
                       .includes(service_days: :service_hours)
                       .find_by(id: session['service_id'])

    return unless @service.presence

    @week_date = params[:week_date]&.to_date || Date.today

    @service_days = @service.service_days
                            .where(date: @week_date.all_week)

    @weeks = @service.weeks
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:name)
  end

  def set_service_session
    session['service_id'] = params[:service_id] if session['service_id'].nil?
  end
end
