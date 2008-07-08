require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_invoice
    assert_difference('Invoice.count') do
      post :create, :invoice => { }
    end

    assert_redirected_to invoice_path(assigns(:invoice))
  end

  def test_should_show_invoice
    get :show, :id => invoices(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => invoices(:one).id
    assert_response :success
  end

  def test_should_update_invoice
    put :update, :id => invoices(:one).id, :invoice => { }
    assert_redirected_to invoice_path(assigns(:invoice))
  end

  def test_should_destroy_invoice
    assert_difference('Invoice.count', -1) do
      delete :destroy, :id => invoices(:one).id
    end

    assert_redirected_to invoices_path
  end
end
