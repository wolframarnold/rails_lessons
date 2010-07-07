require 'spec_helper'

describe CalculatorController do
  describe "POST add" do
    it 'saves the result' do
      lambda {
        post :store, {:result => 5}
      }.should change(Calculations,:count).by(1)
    end
    it 'redirects to results' do
      post :store, {:result => 5}
      response.should redirect_to('results')
    end
  end
end
