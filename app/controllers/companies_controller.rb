class CompaniesController < ApplicationController

  include CompaniesHelper

  # before_filter :authorize, only: [:edit, :update]
  
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.order("LOWER(name)")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  def show_crunchbase
    @company = Company.find(params[:id])
    @name    = @company.name

    enter_crunchbase_keys
    begin 
      @crunchbase_company = Crunchbase::Company.find(@name)
      @company_found = true
    rescue
      # .select{|x| x.namespace != "person"}
      @result = Crunchbase::Search.find(@name).first
      if @result && (@result.namespace == "company" || @result.namespace == "financial-organization")
        @crunchbase_company = @result.entity
      else
        @crunchbase_company = @result
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  def show_linkedin
    @company = Company.find(params[:id])
    @name    = @company.name

    enter_linkedin_keys
    begin
      fields = [{:companies => linkedin_attributes}, :num_results]
      results = @client.search({:keywords => @name, :fields => fields}, 'company')
      @company_hash = results.companies.all.first.to_hash
    rescue
      @company_hash = {}
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  def show_glassdoor
    @company = Company.find(params[:id])
    @name    = @company.name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end
end
