require "application_system_test_case"

class CovidConditionsTest < ApplicationSystemTestCase
  setup do
    @covid_condition = covid_conditions(:one)
  end

  test "visiting the index" do
    visit covid_conditions_url
    assert_selector "h1", text: "Covid Conditions"
  end

  test "creating a Covid condition" do
    visit covid_conditions_url
    click_on "New Covid Condition"

    fill_in "Condition", with: @covid_condition.condition_id
    fill_in "Patient", with: @covid_condition.patient_id
    click_on "Create Covid condition"

    assert_text "Covid condition was successfully created"
    click_on "Back"
  end

  test "updating a Covid condition" do
    visit covid_conditions_url
    click_on "Edit", match: :first

    fill_in "Condition", with: @covid_condition.condition_id
    fill_in "Patient", with: @covid_condition.patient_id
    click_on "Update Covid condition"

    assert_text "Covid condition was successfully updated"
    click_on "Back"
  end

  test "destroying a Covid condition" do
    visit covid_conditions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Covid condition was successfully destroyed"
  end
end
