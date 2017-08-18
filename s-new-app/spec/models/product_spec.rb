require 'rails_helper'

describe Product do 
  context 'when the product has comments' do
      
    let(:product) { Product.create!(name: "apple pie") }
    let(:user) { User.create!(first_name: "Rob", last_name:"Downy", email: "robdowny@yahoo.com", password: "123456")}
      
    before do
      product.comments.create!(rating: 1, user: user, body: "Awful pastry!")
      product.comments.create!(rating: 3, user: user, body: "Ok pastry!")
      product.comments.create!(rating: 5, user: user, body: "Great pastry!")
    end
    
    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq(3)
    end
    
    it "is not valid without a name" do
      expect(Product.new(description: "Nice pastry")).not_to be_valid
    end
  end
end