require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SiteStatsController do

  # This should return the minimal set of attributes required to create a valid
  # SiteStat. As you add validations to SiteStat, be sure to
  # adjust the attributes here as well.
  def valid_attributes
     { :url => SITESTATSTEST['url'], :page => SITESTATSTEST['page'] }
  end

  describe "GET index" do
    it "assigns all site_stats as @site_stats" do
      site_stat = SiteStat.create! valid_attributes
      get :index, {}
      assigns(:site_stats).should eq([site_stat])
    end
  end

  describe "GET show" do
    it "assigns the requested site_stat as @site_stat" do
      site_stat = SiteStat.create! valid_attributes
      get :show, {:id => site_stat.to_param}
      assigns(:site_stat).should eq(site_stat)
    end
  end

  describe "GET new" do
    it "assigns a new site_stat as @site_stat" do
      get :new, {}
      assigns(:site_stat).should be_a_new(SiteStat)
    end
  end

  describe "GET edit" do
    it "assigns the requested site_stat as @site_stat" do
      site_stat = SiteStat.create! valid_attributes
      get :edit, {:id => site_stat.to_param}
      assigns(:site_stat).should eq(site_stat)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SiteStat" do
        expect {
          post :create, {:site_stat => valid_attributes}
        }.to change(SiteStat, :count).by(1)
      end

      it "assigns a newly created site_stat as @site_stat" do
        post :create, {:site_stat => valid_attributes}
        assigns(:site_stat).should be_a(SiteStat)
        assigns(:site_stat).should be_persisted
      end

      it "redirects to the index" do
        post :create, {:site_stat => valid_attributes}
        response.should be_redirect
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved site_stat as @site_stat" do
        # Trigger the behavior that occurs when invalid params are submitted
        SiteStat.any_instance.stub(:save).and_return(false)
        post :create, {:site_stat => { "url" => "invalid value" }}
        assigns(:site_stat).should be_a_new(SiteStat)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SiteStat.any_instance.stub(:save).and_return(false)
        post :create, {:site_stat => { "url" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested site_stat" do
        site_stat = SiteStat.create! valid_attributes
        # Assuming there are no other site_stats in the database, this
        # specifies that the SiteStat created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SiteStat.any_instance.should_receive(:update).with({ "url" => "MyString" })
        put :update, {:id => site_stat.to_param, :site_stat => { "url" => "MyString" }}
      end

      it "assigns the requested site_stat as @site_stat" do
        site_stat = SiteStat.create! valid_attributes
        put :update, {:id => site_stat.to_param, :site_stat => valid_attributes}
        assigns(:site_stat).should eq(site_stat)
      end

      it "redirects to the index" do
        site_stat = SiteStat.create! valid_attributes
        put :update, {:id => site_stat.to_param, :site_stat => valid_attributes}
        response.should be_redirect # to index
      end
    end

    describe "with invalid params" do
      it "assigns the site_stat as @site_stat" do
        site_stat = SiteStat.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SiteStat.any_instance.stub(:save).and_return(false)
        put :update, {:id => site_stat.to_param, :site_stat => { "url" => "invalid value" }}
        assigns(:site_stat).should eq(site_stat)
      end

      it "re-renders the 'edit' template" do
        site_stat = SiteStat.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SiteStat.any_instance.stub(:save).and_return(false)
        put :update, {:id => site_stat.to_param, :site_stat => { "url" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested site_stat" do
      site_stat = SiteStat.create! valid_attributes
      expect {
        delete :destroy, {:id => site_stat.to_param}
      }.to change(SiteStat, :count).by(-1)
    end

    it "redirects to the site_stats list" do
      site_stat = SiteStat.create! valid_attributes
      delete :destroy, {:id => site_stat.to_param}
      response.should redirect_to(site_stats_url)
    end
  end

end
