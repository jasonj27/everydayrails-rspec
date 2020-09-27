require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  #https://github.com/heartcombo/devise/wiki/How-To:-Stub-authentication-in-controller-specs
  let(:user) { double("user") }
  let(:project) { instance_double("Project", owner: user, id: "123") }

  before do
    allow(request.env["warden"]).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
    allow(Project).to receive(:find).with("123").and_return(project)
  end

  describe "#index" do
    it "searches notes by the provided keyword" do
      allow(project).to receive_message_chain(:notes, :search).with("rotate tires")
      get :index, params: { project_id: project.id, term: "rotate tires" }
      
      expect(response).to be_successful
    end
  end
end
