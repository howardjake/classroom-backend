require "test_helper"

class AssignmentMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment_master = assignment_masters(:one)
  end

  test "should get index" do
    get assignment_masters_url, as: :json
    assert_response :success
  end

  test "should create assignment_master" do
    assert_difference('AssignmentMaster.count') do
      post assignment_masters_url, params: { assignment_master: { description: @assignment_master.description, name: @assignment_master.name } }, as: :json
    end

    assert_response 201
  end

  test "should show assignment_master" do
    get assignment_master_url(@assignment_master), as: :json
    assert_response :success
  end

  test "should update assignment_master" do
    patch assignment_master_url(@assignment_master), params: { assignment_master: { description: @assignment_master.description, name: @assignment_master.name } }, as: :json
    assert_response 200
  end

  test "should destroy assignment_master" do
    assert_difference('AssignmentMaster.count', -1) do
      delete assignment_master_url(@assignment_master), as: :json
    end

    assert_response 204
  end
end
