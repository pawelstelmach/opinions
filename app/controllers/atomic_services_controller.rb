class AtomicServicesController < ApplicationController
  # GET /atomic_services
  # GET /atomic_services.xml
  def index
    @atomic_services = AtomicService.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @atomic_services }
    end
  end

  # GET /atomic_services/1
  # GET /atomic_services/1.xml
  def show
    @atomic_service = AtomicService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @atomic_service }
    end
  end

  # GET /atomic_services/new
  # GET /atomic_services/new.xml
  def new
    @atomic_service = AtomicService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @atomic_service }
    end
  end

  # GET /atomic_services/1/edit
  def edit
    @atomic_service = AtomicService.find(params[:id])
  end

  # POST /atomic_services
  # POST /atomic_services.xml
  def create
    @atomic_service = AtomicService.new(params[:atomic_service])

    respond_to do |format|
      if @atomic_service.save
        format.html { redirect_to(@atomic_service, :notice => 'AtomicService was successfully created.') }
        format.xml  { render :xml => @atomic_service, :status => :created, :location => @atomic_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @atomic_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /atomic_services/1
  # PUT /atomic_services/1.xml
  def update
    @atomic_service = AtomicService.find(params[:id])

    respond_to do |format|
      if @atomic_service.update_attributes(params[:atomic_service])
        format.html { redirect_to(@atomic_service, :notice => 'AtomicService was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @atomic_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /atomic_services/1
  # DELETE /atomic_services/1.xml
  def destroy
    @atomic_service = AtomicService.find(params[:id])
    @atomic_service.destroy

    respond_to do |format|
      format.html { redirect_to(atomic_services_url) }
      format.xml  { head :ok }
    end
  end
end
