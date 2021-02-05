require "test_helper"

describe PhotosController do
  let(:photo) { photos(:one) }

  it "should get index" do
    get photos_url
    must_respond_with :success
  end

  it "should get new" do
    get new_photo_url
    must_respond_with :success
  end

  it "should create photo" do
    assert_difference("Photo.count") do
      post photos_url, params: { photo: { city: @photo.city, country: @photo.country, landmark: @photo.landmark, latitude: @photo.latitude, longitude: @photo.longitude, perspective: @photo.perspective, photo_id: @photo.photo_id, photo_url: @photo.photo_url, state: @photo.state, user_id: @photo.user_id } }
    end

    must_redirect_to photo_url(Photo.last)
  end

  it "should show photo" do
    get photo_url(@photo)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_photo_url(@photo)
    must_respond_with :success
  end

  it "should update photo" do
    patch photo_url(@photo), params: { photo: { city: @photo.city, country: @photo.country, landmark: @photo.landmark, latitude: @photo.latitude, longitude: @photo.longitude, perspective: @photo.perspective, photo_id: @photo.photo_id, photo_url: @photo.photo_url, state: @photo.state, user_id: @photo.user_id } }
    must_redirect_to photo_url(photo)
  end

  it "should destroy photo" do
    assert_difference("Photo.count", -1) do
      delete photo_url(@photo)
    end

    must_redirect_to photos_url
  end
end
