class PropertiesController < ApplicationController
  before_action :set_property, only: [:edit, :update, :destroy]

  # GET /properties
  def index
    @properties = current_user.properties.all
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  def create
    local_params = property_params.clone
    local_params[:user_id] = current_user.id
    @property = Property.new(local_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to properties_url, notice: 'Property was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /properties/1
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to properties_url, notice: 'Property was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:title, :area, :placeId, :price, :extra_description, :transaction_type_id)
    end
end
