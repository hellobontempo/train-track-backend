require "test_helper"

class CustomProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @custom_program = custom_programs(:one)
  end

  test "should get index" do
    get custom_programs_url, as: :json
    assert_response :success
  end

  test "should create custom_program" do
    assert_difference('CustomProgram.count') do
      post custom_programs_url, params: { custom_program: { day: @custom_program.day, exercise_id: @custom_program.exercise_id, miles: @custom_program.miles, user_program_id: @custom_program.user_program_id, week: @custom_program.week, workout_date: @custom_program.workout_date } }, as: :json
    end

    assert_response 201
  end

  test "should show custom_program" do
    get custom_program_url(@custom_program), as: :json
    assert_response :success
  end

  test "should update custom_program" do
    patch custom_program_url(@custom_program), params: { custom_program: { day: @custom_program.day, exercise_id: @custom_program.exercise_id, miles: @custom_program.miles, user_program_id: @custom_program.user_program_id, week: @custom_program.week, workout_date: @custom_program.workout_date } }, as: :json
    assert_response 200
  end

  test "should destroy custom_program" do
    assert_difference('CustomProgram.count', -1) do
      delete custom_program_url(@custom_program), as: :json
    end

    assert_response 204
  end
end
