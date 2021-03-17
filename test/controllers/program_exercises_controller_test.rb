require "test_helper"

class ProgramExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_exercise = program_exercises(:one)
  end

  test "should get index" do
    get program_exercises_url, as: :json
    assert_response :success
  end

  test "should create program_exercise" do
    assert_difference('ProgramExercise.count') do
      post program_exercises_url, params: { program_exercise: { amount: @program_exercise.amount, day: @program_exercise.day, exercise_id: @program_exercise.exercise_id, program_id: @program_exercise.program_id } }, as: :json
    end

    assert_response 201
  end

  test "should show program_exercise" do
    get program_exercise_url(@program_exercise), as: :json
    assert_response :success
  end

  test "should update program_exercise" do
    patch program_exercise_url(@program_exercise), params: { program_exercise: { amount: @program_exercise.amount, day: @program_exercise.day, exercise_id: @program_exercise.exercise_id, program_id: @program_exercise.program_id } }, as: :json
    assert_response 200
  end

  test "should destroy program_exercise" do
    assert_difference('ProgramExercise.count', -1) do
      delete program_exercise_url(@program_exercise), as: :json
    end

    assert_response 204
  end
end
