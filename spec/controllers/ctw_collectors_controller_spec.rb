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

describe CtwCollectorsController do

  # This should return the minimal set of attributes required to create a valid
  # CtwCollector. As you add validations to CtwCollector, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all ctw_collectors as @ctw_collectors" do
      ctw_collector = CtwCollector.create! valid_attributes
      get :index
      assigns(:ctw_collectors).should eq([ctw_collector])
    end
  end

  describe "GET show" do
    it "assigns the requested ctw_collector as @ctw_collector" do
      ctw_collector = CtwCollector.create! valid_attributes
      get :show, :id => ctw_collector.id
      assigns(:ctw_collector).should eq(ctw_collector)
    end
  end

  describe "GET new" do
    it "assigns a new ctw_collector as @ctw_collector" do
      get :new
      assigns(:ctw_collector).should be_a_new(CtwCollector)
    end
  end

  describe "GET edit" do
    it "assigns the requested ctw_collector as @ctw_collector" do
      ctw_collector = CtwCollector.create! valid_attributes
      get :edit, :id => ctw_collector.id
      assigns(:ctw_collector).should eq(ctw_collector)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CtwCollector" do
        expect {
          post :create, :ctw_collector => valid_attributes
        }.to change(CtwCollector, :count).by(1)
      end

      it "assigns a newly created ctw_collector as @ctw_collector" do
        post :create, :ctw_collector => valid_attributes
        assigns(:ctw_collector).should be_a(CtwCollector)
        assigns(:ctw_collector).should be_persisted
      end

      it "redirects to the created ctw_collector" do
        post :create, :ctw_collector => valid_attributes
        response.should redirect_to(CtwCollector.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ctw_collector as @ctw_collector" do
        # Trigger the behavior that occurs when invalid params are submitted
        CtwCollector.any_instance.stub(:save).and_return(false)
        post :create, :ctw_collector => {}
        assigns(:ctw_collector).should be_a_new(CtwCollector)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CtwCollector.any_instance.stub(:save).and_return(false)
        post :create, :ctw_collector => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested ctw_collector" do
        ctw_collector = CtwCollector.create! valid_attributes
        # Assuming there are no other ctw_collectors in the database, this
        # specifies that the CtwCollector created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CtwCollector.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => ctw_collector.id, :ctw_collector => {'these' => 'params'}
      end

      it "assigns the requested ctw_collector as @ctw_collector" do
        ctw_collector = CtwCollector.create! valid_attributes
        put :update, :id => ctw_collector.id, :ctw_collector => valid_attributes
        assigns(:ctw_collector).should eq(ctw_collector)
      end

      it "redirects to the ctw_collector" do
        ctw_collector = CtwCollector.create! valid_attributes
        put :update, :id => ctw_collector.id, :ctw_collector => valid_attributes
        response.should redirect_to(ctw_collector)
      end
    end

    describe "with invalid params" do
      it "assigns the ctw_collector as @ctw_collector" do
        ctw_collector = CtwCollector.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CtwCollector.any_instance.stub(:save).and_return(false)
        put :update, :id => ctw_collector.id, :ctw_collector => {}
        assigns(:ctw_collector).should eq(ctw_collector)
      end

      it "re-renders the 'edit' template" do
        ctw_collector = CtwCollector.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CtwCollector.any_instance.stub(:save).and_return(false)
        put :update, :id => ctw_collector.id, :ctw_collector => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ctw_collector" do
      ctw_collector = CtwCollector.create! valid_attributes
      expect {
        delete :destroy, :id => ctw_collector.id
      }.to change(CtwCollector, :count).by(-1)
    end

    it "redirects to the ctw_collectors list" do
      ctw_collector = CtwCollector.create! valid_attributes
      delete :destroy, :id => ctw_collector.id
      response.should redirect_to(ctw_collectors_url)
    end
  end

end