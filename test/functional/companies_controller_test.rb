require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { crunchbase_url: @company.crunchbase_url, founded_year: @company.founded_year, glassdoor_url: @company.glassdoor_url, linkedin_url: @company.linkedin_url, name: @company.name, number_of_employees: @company.number_of_employees, overview: @company.overview, twitter_username: @company.twitter_username, website: @company.website }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    put :update, id: @company, company: { crunchbase_url: @company.crunchbase_url, founded_year: @company.founded_year, glassdoor_url: @company.glassdoor_url, linkedin_url: @company.linkedin_url, name: @company.name, number_of_employees: @company.number_of_employees, overview: @company.overview, twitter_username: @company.twitter_username, website: @company.website }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
