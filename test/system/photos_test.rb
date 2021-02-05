require "application_system_test_case"

describe "Photos", :system do
  let(:photo) { photos(:one) }

  it "visiting the index" do
    visit photos_url
    assert_selector "h1", text: "Photos"
  end

  it "creating a Photo" do
    visit photos_url
    click_on "New Photo"

    fill_in "City", with: @photo.city
    fill_in "Country", with: @photo.country
    fill_in "Landmark", with: @photo.landmark
    fill_in "Latitude", with: @photo.latitude
    fill_in "Longitude", with: @photo.longitude
    fill_in "Perspective", with: @photo.perspective
    fill_in "Photo_id", with: @photo.photo_id
    fill_in "Photo_url", with: @photo.photo_url
    fill_in "State", with: @photo.state
    fill_in "User_id", with: @photo.user_id
    click_on "Create Photo"

    assert_text "Photo was successfully created"
    click_on "Back"
  end

  it "updating a Photo" do
    visit photos_url
    click_on "Edit", match: :first

    fill_in "City", with: @photo.city
    fill_in "Country", with: @photo.country
    fill_in "Landmark", with: @photo.landmark
    fill_in "Latitude", with: @photo.latitude
    fill_in "Longitude", with: @photo.longitude
    fill_in "Perspective", with: @photo.perspective
    fill_in "Photo_id", with: @photo.photo_id
    fill_in "Photo_url", with: @photo.photo_url
    fill_in "State", with: @photo.state
    fill_in "User_id", with: @photo.user_id
    click_on "Update Photo"

    assert_text "Photo was successfully updated"
    click_on "Back"
  end

  it "destroying a Photo" do
    visit photos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Photo was successfully destroyed"
  end
end
