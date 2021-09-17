require "application_system_test_case"

class UserdatsTest < ApplicationSystemTestCase
  setup do
    @userdat = userdats(:one)
  end

  test "visiting the index" do
    visit userdats_url
    assert_selector "h1", text: "Userdats"
  end

  test "creating a Userdat" do
    visit userdats_url
    click_on "New Userdat"

    fill_in "Bloodgroup", with: @userdat.bloodgroup
    fill_in "Dob", with: @userdat.dob
    fill_in "Fullname", with: @userdat.fullname
    fill_in "Gender", with: @userdat.gender
    fill_in "Vaccination", with: @userdat.vaccination
    click_on "Create Userdat"

    assert_text "Userdat was successfully created"
    click_on "Back"
  end

  test "updating a Userdat" do
    visit userdats_url
    click_on "Edit", match: :first

    fill_in "Bloodgroup", with: @userdat.bloodgroup
    fill_in "Dob", with: @userdat.dob
    fill_in "Fullname", with: @userdat.fullname
    fill_in "Gender", with: @userdat.gender
    fill_in "Vaccination", with: @userdat.vaccination
    click_on "Update Userdat"

    assert_text "Userdat was successfully updated"
    click_on "Back"
  end

  test "destroying a Userdat" do
    visit userdats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Userdat was successfully destroyed"
  end
end
