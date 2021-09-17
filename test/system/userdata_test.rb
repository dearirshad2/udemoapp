require "application_system_test_case"

class UserdataTest < ApplicationSystemTestCase
  setup do
    @userdatum = userdata(:one)
  end

  test "visiting the index" do
    visit userdata_url
    assert_selector "h1", text: "Userdata"
  end

  test "creating a Userdatum" do
    visit userdata_url
    click_on "New Userdatum"

    fill_in "Bloodgroup", with: @userdatum.bloodgroup
    fill_in "Dob", with: @userdatum.dob
    fill_in "Fullname", with: @userdatum.fullname
    fill_in "Gender", with: @userdatum.gender
    fill_in "Vaccination", with: @userdatum.vaccination
    click_on "Create Userdatum"

    assert_text "Userdatum was successfully created"
    click_on "Back"
  end

  test "updating a Userdatum" do
    visit userdata_url
    click_on "Edit", match: :first

    fill_in "Bloodgroup", with: @userdatum.bloodgroup
    fill_in "Dob", with: @userdatum.dob
    fill_in "Fullname", with: @userdatum.fullname
    fill_in "Gender", with: @userdatum.gender
    fill_in "Vaccination", with: @userdatum.vaccination
    click_on "Update Userdatum"

    assert_text "Userdatum was successfully updated"
    click_on "Back"
  end

  test "destroying a Userdatum" do
    visit userdata_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Userdatum was successfully destroyed"
  end
end
