require 'spec_helper'

describe CalculatorController do
  describe "GET add" do
    it "renders the result view template" do
      get :add
      response.should render_template('calculator/results')
    end

    it "sets a sum instance variable" do
      get :add
      assigns[:sum].should_not be_nil  # note: assigns[:sum] returns the value of @sum assigned inside the controller action
    end

    it "adds two operands passed as parameters and returns the result in the sum instance variable" do
      get :add, :operand1 => 4, :operand2 => 7
      assigns[:sum].should == 11
    end

  end
end
