 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/properties", type: :request do
  # Property. As you add validations to Property, be sure to
  # adjust the attributes here as well.
  let(:user) {create(:user)}
  let(:transaction_type) {create(:transaction_type)}

  let(:valid_attributes) {
    {
      title: 'new ad',
      area: 'area 51',
      placeId: 'randomString',
      price: 120,
      user_id: user.id,
      transaction_type_id: transaction_type.id
    }
  }

  let(:invalid_attributes) {
    {
      title: 'new ad',
      area: nil,
      placeId: 'randomString',
      price: 120
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Property.create! valid_attributes
      get properties_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_property_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      property = Property.create! valid_attributes
      get edit_property_url(property)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    before(:each) do
      get sessions_login_url(id: user.id)
    end

    context "with valid parameters" do
      it "creates a new Property" do
        expect {
          post properties_url, params: { property: valid_attributes }
        }.to change(Property, :count).by(1)
      end

      it "redirects to the created property" do
        post properties_url, params: { property: valid_attributes }
        expect(response).to redirect_to(property_url(Property.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Property" do
        expect {
          post properties_url, params: { property: invalid_attributes }
        }.to change(Property, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post properties_url, params: { property: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          title: 'another ad',
          area: 'area 52',
          placeId: 'randomString2',
          price: 150,
          user_id: user.id,
          transaction_type_id: transaction_type.id
        }
      }

      it "redirects to the property" do
        property = Property.create! valid_attributes
        patch property_url(property), params: { property: new_attributes }
        property.reload
        expect(response).to redirect_to(property_url(property))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        property = Property.create! valid_attributes
        patch property_url(property), params: { property: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested property" do
      property = Property.create! valid_attributes
      expect {
        delete property_url(property)
      }.to change(Property, :count).by(-1)
    end

    it "redirects to the properties list" do
      property = Property.create! valid_attributes
      delete property_url(property)
      expect(response).to redirect_to(properties_url)
    end
  end
end
