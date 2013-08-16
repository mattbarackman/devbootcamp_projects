require 'rspec'

require_relative 'cookie'

describe Cookie do

  let(:type)   { "peanut butter" }
  let(:cookie) { Cookie.new(type) }

  describe "#initialize" do
      
    it "has a type" do
      expect(cookie.type).not_to be_nil
    end

  end

  describe "#type" do
    it "returns the cookie's type" do
      expect(cookie.type).to eq type
    end
  end

  describe "#status" do

    context "when unbaked" do
      it "is `:doughy`" do
        expect(cookie.status).to eq :doughy
      end
    end

    context "when baked for less than 7 minutes" do
      it "is still `:doughy`" do
        expect{cookie.bake!(5)}.not_to change(cookie, :status)
      end
    end  

    context "when baked for at least 7 but less than 10 minutes" do
      it "is `:almost_ready`" do
        expect{cookie.bake!(8)}.to change(cookie, :status).from(:doughy).to(:almost_ready)
      end
    end

    context "when baked for at least 10 but less than 12 minutes" do
      it "is `:ready`" do
        expect{cookie.bake!(11)}.to change(cookie, :status).from(:doughy).to(:ready)
      end
    end

    context "when baked for at least 12 minutes" do
      it "is `:burned`" do
        expect{cookie.bake!(12)}.to change(cookie, :status).from(:doughy).to(:burned)
      end
    end
  end
end
