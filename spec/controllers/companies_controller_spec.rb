require 'spec_helper'

describe CompaniesController do
  describe "GET #index" do
    it "populates an array of companies" do
      company1 = FactoryGirl.create(:company)
      company2 = FactoryGirl.create(:company)
      get :index
      assigns(:companies).should eq([company1, company2])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested company to @company" do
      company = FactoryGirl.create(:company)
      get :show, id: company
      assigns(:company).should eq(company)
    end

    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:company)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    let(:user) { FactoryGirl.create(:user) }

    it "assigns a new company to @company" do
      get :new
      assigns(:company).should be_new_record
    end

    it "renders the :new template" do
      # post login_path, :email => user.email, :password => 'secret'
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new company in the database" do
        expect { post :create, company: FactoryGirl.attributes_for(:company) }.
        to change(Company,:count).by(1)
      end

      it "redirects to the new company" do
        post :create, company: FactoryGirl.attributes_for(:company)
        response.should redirect_to Company.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new company in the database" do
      end

      it "re-renders the :new template" do
        post :create, company: FactoryGirl.attributes_for(:company)
        response.should render_template :new
      end
    end
  end
end