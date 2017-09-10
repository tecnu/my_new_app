require 'rails_helper'

describe Comment do
  
  context "is made without body" do
    it "returns not valid" do
      @comment = FactoryGirl.build(:comment, body:"")
      expect(@comment).to_not be_valid
    end
  end

  context "is made without a user_id" do
    it "returns not valid" do
      @comment = FactoryGirl.build(:comment, user_id:"")
      expect(@comment).to_not be_valid
    end
  end

  context "is made without a product_id" do
    it "returns not valid" do
      @comment = FactoryGirl.build(:comment, product_id:"")
      expect(@comment).to_not be_valid
    end
  end

  context "is made without a rating" do
    it "returns not valid" do
      @comment = FactoryGirl.build(:comment, rating:"")
      expect(@comment).to_not be_valid
    end
  end
end