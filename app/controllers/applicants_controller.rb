class ApplicantsController < ApplicationController
  # GET /applicants
  # GET /applicants.json
  def index
    sort_param = params[:sort]
    sort_param ||= session[:sort]
    
    session[:sort] = params[:sort] if params[:sort] != nil
    
    case sort_param
    when "fname"
      sort = "fname ASC"
      @sort_text = "The applicants are sorted by their first name."
    when "date"
      sort = "date_applied ASC"
      @sort_text = "The applicants sorted by the date they applied."
    when "average"
      sort = "average_score DESC"
      @sort_text = "The applicants sorted by the average evaluation scores."
    when "deviation"
      sort = "average_score_precision ASC"
      @sort_text = "The applicants sorted by how closely each member's evaluations align. The closer to zero, the better."
    when "skype"
      sort = "skype_vote_total DESC, average_score DESC"
      @sort_text = "The applicants sorted by the number of recommendations to be included in the Skype interviews."
    when "skypelist"
      sort = "skype_list DESC, skype_vote_total DESC, average_score DESC"
      @sort_text = "The applicants sorted by if they are on the skype short list or not."
    else
      sort = "lname ASC"
      @sort_text = "The applicants are sorted by their last name."
    end
    @applicants = Applicant.all(:order => sort)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @applicants }
    end
  end

  def index_skype
    @applicants = Applicant.all(:conditions => { :skype_list => "3" }, :order => "average_score DESC")
  end

  # GET /applicants/1
  # GET /applicants/1.json
  def show
    @applicant = Applicant.find(params[:id])
    @responses = @applicant.member_responses

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @applicant }
    end
  end
  
  # GET /applicants/1/evalute
  def evaluate
    @applicant = Applicant.find(params[:id])
    @member_response = @applicant.member_responses.find_or_initialize_by_member_id(@current_member.id)
  end
  
  # POST /applicants/1/evalute/save
  def save_evaluation
    @applicant = Applicant.find(params[:id])
    @member_response = @applicant.member_responses.find_or_initialize_by_member_id(@current_member.id)
    @member_response.update_attributes(params[:member_response])
    
    redirect_to applicants_url, :notice => "Evaluation for #{@applicant} has been saved."
  end

  # GET /applicants/new
  # GET /applicants/new.json
  def new
    @applicant = Applicant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @applicant }
    end
  end

  # GET /applicants/1/edit
  def edit
    @applicant = Applicant.find(params[:id])
    @applicant_files = @applicant.applicant_files.build()
  end

  # POST /applicants
  # POST /applicants.json
  def create
    @applicant = Applicant.new(params[:applicant])

    respond_to do |format|
      if @applicant.save
        format.html { redirect_to applicants_url, :notice => 'Applicant was successfully created.' }
        format.json { render :json => @applicant, :status => :created, :location => @applicant }
      else
        format.html { render :action => "new" }
        format.json { render :json => @applicant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /applicants/1
  # PUT /applicants/1.json
  def update
    @applicant = Applicant.find(params[:id])

    respond_to do |format|
      if @applicant.update_attributes(params[:applicant])
        format.html { redirect_to @applicant, :notice => 'Applicant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @applicant.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update_skype_list
    ## For easy sorting, skype_list values:
    # 3 => added to skype list
    # 2 => undecided
    # 1 => not added to skype list
    
    @applicant = Applicant.find(params[:id])
    
    case params[:value]
    when "true"
      @applicant.skype_list = 3
    when "false"
      @applicant.skype_list = 1
    else
      @applicant.skype_list = 2
    end
    
    
    
    respond_to do |format|
      if @applicant.save
        format.html { redirect_to applicants_url, :notice => 'The Skype list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @applicant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1
  # DELETE /applicants/1.json
  def destroy
    @applicant = Applicant.find(params[:id])
    @applicant.destroy

    respond_to do |format|
      format.html { redirect_to applicants_url }
      format.json { head :no_content }
    end
  end
end
