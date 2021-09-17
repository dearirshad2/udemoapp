require "test_helper"

class UserdatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userdat = userdats(:one)
  end

  test "should get index" do
    get userdats_url
    assert_response :success
  end

  test "should get new" do
    get new_userdat_url
    assert_response :success
  end

  test "should create userdat" do
    assert_difference('Userdat.count') do
      post userdats_url, params: { userdat: { bloodgroup: @userdat.bloodgroup, dob: @userdat.dob, fullname: @userdat.fullname, gender: @userdat.gender, vaccination: @userdat.vaccination } }
    end

    assert_redirected_to userdat_url(Userdat.last)
  end

  test "should show userdat" do
    get userdat_url(@userdat)
    assert_response :success
  end

  test "should get edit" do
    get edit_userdat_url(@userdat)
    assert_response :success
  end

  test "should update userdat" do
    patch userdat_url(@userdat), params: { userdat: { bloodgroup: @userdat.bloodgroup, dob: @userdat.dob, fullname: @userdat.fullname, gender: @userdat.gender, vaccination: @userdat.vaccination } }
    assert_redirected_to userdat_url(@userdat)
  end

  test "should destroy userdat" do
    assert_difference('Userdat.count', -1) do
      delete userdat_url(@userdat)
    end

    assert_redirected_to userdats_url
  end
end
