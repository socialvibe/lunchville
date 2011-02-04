require 'test_helper'

class ProposalsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proposals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proposal" do
    assert_difference('Proposal.count') do
      post :create, :proposal => { }
    end

    assert_redirected_to proposal_path(assigns(:proposal))
  end

  test "should show proposal" do
    get :show, :id => proposals(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => proposals(:one).to_param
    assert_response :success
  end

  test "should update proposal" do
    put :update, :id => proposals(:one).to_param, :proposal => { }
    assert_redirected_to proposal_path(assigns(:proposal))
  end

  test "should destroy proposal" do
    assert_difference('Proposal.count', -1) do
      delete :destroy, :id => proposals(:one).to_param
    end

    assert_redirected_to proposals_path
  end
end
