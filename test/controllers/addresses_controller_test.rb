require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @address = addresses(:one)
  end

  test "should get index" do
    get addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_address_url
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post addresses_url, params: { address: { city: @address.city, country: @address.country, first_name: @address.first_name, postal_code: @address.postal_code, street: @address.street, surname: @address.surname, user_id: @address.user_id } }
    end

    assert_redirected_to address_url(Address.last)
  end

  test "should show address" do
    get address_url(@address)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_url(@address)
    assert_response :success
  end

  test "should update address" do
    patch address_url(@address), params: { address: { city: @address.city, country: @address.country, first_name: @address.first_name, postal_code: @address.postal_code, street: @address.street, surname: @address.surname, user_id: @address.user_id } }
    assert_redirected_to address_url(@address)
  end

  #test "should destroy address" do
  #  assert_difference('Address.count', -1) do
  #    delete address_url(@address)
  #  end
  #
  #  assert_redirected_to addresses_url
  #end
end
