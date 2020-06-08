require 'test_helper'

class CovidConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @covid_condition = covid_conditions(:one)
  end

  test "should get index" do
    get covid_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_covid_condition_url
    assert_response :success
  end

  test "should create covid_condition" do
    assert_difference('CovidCondition.count') do
      post covid_conditions_url, params: { covid_condition: { condition_id: @covid_condition.condition_id, patient_id: @covid_condition.patient_id } }
    end

    assert_redirected_to covid_condition_url(CovidCondition.last)
  end

  test "should show covid_condition" do
    get covid_condition_url(@covid_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_covid_condition_url(@covid_condition)
    assert_response :success
  end

  test "should update covid_condition" do
    patch covid_condition_url(@covid_condition), params: { covid_condition: { condition_id: @covid_condition.condition_id, patient_id: @covid_condition.patient_id } }
    assert_redirected_to covid_condition_url(@covid_condition)
  end

  test "should destroy covid_condition" do
    assert_difference('CovidCondition.count', -1) do
      delete covid_condition_url(@covid_condition)
    end

    assert_redirected_to covid_conditions_url
  end
end
