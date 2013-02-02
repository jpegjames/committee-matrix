class SkypeInterviewRecordingsController < ApplicationController
  # GET /skype_interview_recordings
  # GET /skype_interview_recordings.json
  def index
    @skype_interview_recordings = SkypeInterviewRecording.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @skype_interview_recordings }
    end
  end

  # GET /skype_interview_recordings/1
  # GET /skype_interview_recordings/1.json
  def show
    @skype_interview_recording = SkypeInterviewRecording.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @skype_interview_recording }
    end
  end

  # GET /skype_interview_recordings/new
  # GET /skype_interview_recordings/new.json
  def new
    @skype_interview_recording = SkypeInterviewRecording.new
    @applicants = Applicant.all(:conditions => { :skype_list => "3" }, :order => "skype_date ASC")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @skype_interview_recording }
    end
  end

  # GET /skype_interview_recordings/1/edit
  def edit
    @skype_interview_recording = SkypeInterviewRecording.find(params[:id])
    @applicants = Applicant.all(:conditions => { :skype_list => "3" }, :order => "skype_date ASC")
  end

  # POST /skype_interview_recordings
  # POST /skype_interview_recordings.json
  def create
    @skype_interview_recording = SkypeInterviewRecording.new(params[:skype_interview_recording])

    respond_to do |format|
      if @skype_interview_recording.save
        format.html { redirect_to @skype_interview_recording, :notice => 'Skype interview recording was successfully created.' }
        format.json { render :json => @skype_interview_recording, :status => :created, :location => @skype_interview_recording }
      else
        format.html { render :action => "new" }
        format.json { render :json => @skype_interview_recording.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /skype_interview_recordings/1
  # PUT /skype_interview_recordings/1.json
  def update
    @skype_interview_recording = SkypeInterviewRecording.find(params[:id])

    respond_to do |format|
      if @skype_interview_recording.update_attributes(params[:skype_interview_recording])
        format.html { redirect_to @skype_interview_recording, :notice => 'Skype interview recording was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @skype_interview_recording.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /skype_interview_recordings/1
  # DELETE /skype_interview_recordings/1.json
  def destroy
    @skype_interview_recording = SkypeInterviewRecording.find(params[:id])
    @skype_interview_recording.destroy

    respond_to do |format|
      format.html { redirect_to skype_interview_recordings_url }
      format.json { head :no_content }
    end
  end
end
