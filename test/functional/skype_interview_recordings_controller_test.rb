require 'test_helper'

class SkypeInterviewRecordingsControllerTest < ActionController::TestCase
  setup do
    @skype_interview_recording = skype_interview_recordings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skype_interview_recordings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skype_interview_recording" do
    assert_difference('SkypeInterviewRecording.count') do
      post :create, :skype_interview_recording => {  }
    end

    assert_redirected_to skype_interview_recording_path(assigns(:skype_interview_recording))
  end

  test "should show skype_interview_recording" do
    get :show, :id => @skype_interview_recording
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @skype_interview_recording
    assert_response :success
  end

  test "should update skype_interview_recording" do
    put :update, :id => @skype_interview_recording, :skype_interview_recording => {  }
    assert_redirected_to skype_interview_recording_path(assigns(:skype_interview_recording))
  end

  test "should destroy skype_interview_recording" do
    assert_difference('SkypeInterviewRecording.count', -1) do
      delete :destroy, :id => @skype_interview_recording
    end

    assert_redirected_to skype_interview_recordings_path
  end
end
