require "test_helper"

class UserProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_program = user_programs(:one)
  end

  test "should get index" do
    get user_programs_url, as: :json
    assert_response :success
  end

  test "should create user_program" do
    assert_difference('UserProgram.count') do
      post user_programs_url, params: { user_program: { program_id: @user_program.program_id, start_date: @user_program.start_date, username: @user_program.username } }, as: :json
    end

    assert_response 201
  end

  test "should show user_program" do
    get user_program_url(@user_program), as: :json
    assert_response :success
  end

  test "should update user_program" do
    patch user_program_url(@user_program), params: { user_program: { program_id: @user_program.program_id, start_date: @user_program.start_date, username: @user_program.username } }, as: :json
    assert_response 200
  end

  test "should destroy user_program" do
    assert_difference('UserProgram.count', -1) do
      delete user_program_url(@user_program), as: :json
    end

    assert_response 204
  end
end
