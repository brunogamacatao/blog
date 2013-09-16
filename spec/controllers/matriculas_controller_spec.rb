require 'spec_helper'

describe MatriculasController do

  describe "GET 'nova'" do
    it "returns http success" do
      get 'nova'
      response.should be_success
    end
  end

  describe "GET 'confirmar'" do
    it "returns http success" do
      get 'confirmar'
      response.should be_success
    end
  end

end
