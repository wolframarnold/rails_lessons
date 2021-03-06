require "spec_helper"

describe PeopleController do

  describe "GET index action" do

    it 'should load a list of people' do
      get :index
      assigns[:people].should_not be_nil
    end

    it 'should render index template' do
      get :index
      response.should render_template('index')
    end
  end

  describe "GET new action" do
    it 'renders the "new" template' do
      get :new
      response.should render_template('new')
    end
  end

  describe 'POST create action' do
    it 'should add a new person to the database' do
      lambda {
        post :create, {:people => { :first_name => 'Joe', :last_name => 'Smith'} }
      }.should change(Person, :count).by(1)
    end
    it 'should sets a controller instance variable @person' do
      post :create, {:people => { :first_name => 'Joe', :last_name => 'Smith'} }
      assigns[:person].should_not be_nil
      assigns[:person].first_name.should == 'Joe'
      assigns[:person].last_name.should == 'Smith'
    end
    it 'responds with a redirect to index' do
      post :create, {:people => { :first_name => 'Joe', :last_name => 'Smith'} }
      response.should redirect_to('index')
    end
  end
end
