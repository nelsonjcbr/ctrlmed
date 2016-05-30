require 'test_helper'

class PadraosControllerTest < ActionController::TestCase
  setup do
    @padrao = padraos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:padraos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create padrao" do
    assert_difference('Padrao.count') do
      post :create, padrao: { campo: @padrao.campo, valores: @padrao.valores }
    end

    assert_redirected_to padrao_path(assigns(:padrao))
  end

  test "should show padrao" do
    get :show, id: @padrao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @padrao
    assert_response :success
  end

  test "should update padrao" do
    patch :update, id: @padrao, padrao: { campo: @padrao.campo, valores: @padrao.valores }
    assert_redirected_to padrao_path(assigns(:padrao))
  end

  test "should destroy padrao" do
    assert_difference('Padrao.count', -1) do
      delete :destroy, id: @padrao
    end

    assert_redirected_to padraos_path
  end
end
