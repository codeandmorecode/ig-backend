class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /photos or /photos.json
  def index
    # @photos = Photo.all
    data = Photo.all
    render status: :ok, json: data
  end

  # GET /photos/1 or /photos/1.json
  def show
    render(
        status: :ok,
        json: @photo.as_json(
            only: [:photo_id, :country, :state, :city, :landmark, :latitude, :longitude, :perspective, :user_id, :photo_url],
        )
    )
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  def next_photo_id

  end
  # POST /photos or /photos.json
  def create
    parameters = photo_params
    parameters[:photo_id] = next_photo_id
    # parameters[:photo_id] = parameters[:photo_id].to_i
    parameters[:user_id] = parameters[:user_id].to_i
    parameters[:latitude] = parameters[:latitude].to_f
    parameters[:longitude] = parameters[:longitude].to_f

    @photo = Photo.new(parameters)

    # respond_to do |format|
      if @photo.save
        # format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        # format.json { render :show, status: :created, location: @photo }
        render json: @photo
      # else
      #   format.html { render :new, status: :unprocessable_entity }
      #   format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def searchlocation
    results = []
    Photo.all.each do |photo|
      if photo.country == params[:country] && photo.state == params[:state] && photo.city == params[:city]
        results << photo
      end
    end
    render status: :ok, json: results
  end

  # def searchlandmark
  #   results = []
  #   Photo.all.each do |photo|
  #     if photo.landmark == params[:landmark]
  #       results << photo
  #     end
  #   end
  #   render status: :ok, json: results
  # end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def photo_params
    params.require(:photo).permit(:photo_id,
                                  :country,
                                  :state,
                                  :city,
                                  :landmark,
                                  :latitude,
                                  :longitude,
                                  :perspective,
                                  :user_id,
                                  :photo_url)
  end
end
