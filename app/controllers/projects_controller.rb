class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    #logger.debug "mmm: #{params[:customer_id]}"
    @project = Project.new(project_params)
    #if params[:customer_id]
    #  customer = Customer.find(params[:customer_id].to_i)
    #  @project.customer = customer
    #end
    project_params.each do |key, value|
      logger.debug "#{key}: #{value}"
    end
    #params.each do |key, value|
    #  logger.debug "#{key}: #{value}"
    #end

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    logger.debug "@project.work_mode '#{@project.work_mode}'"
    if @project.work_mode == 'by_hours'
      @project.value = nil;
    else
      @project.hour_rate = nil;
    end
    logger.debug "@project.value '#{@project.value}'"
    logger.debug "@project.hour_rate '#{@project.hour_rate}'"
    logger.debug "project_params = #{project_params}"

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :state, :start_date, :end_date, :customer_id, :work_mode, :hour_rate, :value)
    end
end
