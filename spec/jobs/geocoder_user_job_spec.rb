require 'rails_helper'

RSpec.describe GeocoderUserJob, type: :job do
  it "calls geocode on the user" do
    user = instance_double("User")
    expect(user).to receive(:geocode)
    GeocodeUserJob.perform_now(user)
  end
end
