require 'spec_helper'

describe CompaniesController do

  # This should return the minimal set of attributes required to create a valid
  # Company. As you add validations to Company, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { name: "Yo" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompanysController. Be sure to keep this updated too.
  let(:valid_session) { {} }


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


  describe "GET edit" do
    it "assigns the requested company as @company" do
      company = Company.create! valid_attributes
      get :edit, {:id => company.to_param}, valid_session
      assigns(:company).should eq(company)
    end

    it "renders the :edit template" do
      # post login_path, :email => user.email, :password => 'secret'
      company = Company.create! valid_attributes
      get :edit, {:id => company.to_param}, valid_session
      response.should render_template :edit
    end
  end


  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new company in the database" do
        expect { post :create, company: FactoryGirl.attributes_for(:company) }.
        to change(Company,:count).by(1)
      end

      it "assigns a newly created company as @company" do
        post :create, company: FactoryGirl.attributes_for(:company)
        assigns(:company).should be_a(Company)
        assigns(:company).should be_persisted
      end

      it "redirects to the new company" do
        post :create, company: FactoryGirl.attributes_for(:company)
        response.should redirect_to Company.last
      end
    end

    context "with invalid attributes" do
      it "assigns a newly created but unsaved company as @company" do
        Company.any_instance.stub(:save).and_return(false)
        post :create, company: FactoryGirl.attributes_for(:company)
        assigns(:company).should be_a_new(Company)
      end

      it "re-renders the :new template" do
        Company.any_instance.stub(:save).and_return(false)
        post :create, company: FactoryGirl.attributes_for(:company)
        response.should render_template :new
      end
    end
  end


  describe "PUT #update" do
    context "with valid params" do
      # it "updates the requested company" do
      #   company = FactoryGirl.create(:company)
      #   # Assuming there are no other companys in the database, this
      #   # specifies that the Company created on the previous line
      #   # receives the :update_attributes message with whatever params are
      #   # submitted in the request.
      #   Company.any_instance.should_receive(:update).with( valid_attributes)
      #   put :update, {:id => company.to_param, :company => valid_attributes}, valid_session
      # end

      it "assigns the requested company as @company" do
        company = FactoryGirl.create(:company)
        put :update, {:id => company.to_param, :company => valid_attributes}, valid_session
        assigns(:company).should eq(company)
      end

      it "redirects to the company" do
        company = FactoryGirl.create(:company)
        put :update, {:id => company.to_param, :company => valid_attributes}, valid_session
        response.should redirect_to company
      end
    end

    context "with invalid params" do
      it "assigns the company as @company" do
        company = FactoryGirl.create(:company)
        # Trigger the behavior that occurs when invalid params are submitted
        Company.any_instance.stub(:save).and_return(false)
        put :update, {:id => company.to_param, :company => {  }}, valid_session
        assigns(:company).should eq(company)
      end

      it "re-renders the 'edit' template" do
        company = FactoryGirl.create(:company)
        # Trigger the behavior that occurs when invalid params are submitted
        Company.any_instance.stub(:save).and_return(false)
        put :update, {:id => company.to_param, :company => {  }}, valid_session
        response.should render_template :edit
      end
    end
  end


  describe "DELETE #destroy" do
    it "destroys the requested company" do
      company = FactoryGirl.create(:company)
      expect {
        delete :destroy, {:id => company.to_param}, valid_session
      }.to change(Company, :count).by(-1)
    end

    it "redirects to the companys list" do
      company = FactoryGirl.create(:company)
      delete :destroy, {:id => company.to_param}, valid_session
      response.should redirect_to companies_url
    end
  end
end