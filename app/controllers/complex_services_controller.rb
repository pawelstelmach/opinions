class ComplexServicesController < ApplicationController
  # GET /complex_services
  # GET /complex_services.xml
  def index
    @complex_services = ComplexService.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @complex_services }
    end
  end
  
  def opinion
	@complex_service = ComplexService.find(params[:id])
	@opinion = @complex_service.opinion
	@complex_service.update_attributes(:belief => @opinion.belief, :disbelief=> @opinion.disbelief, :uncertainty=> @opinion.uncertainty)
  end

  # GET /complex_services/1
  # GET /complex_services/1.xml
  def show
    @complex_service = ComplexService.find(params[:id])
	
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @complex_service }
    end
  end

  # GET /complex_services/new
  # GET /complex_services/new.xml
  def new
    @complex_service = ComplexService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @complex_service }
    end
  end

  # GET /complex_services/1/edit
  def edit
    @complex_service = ComplexService.find(params[:id])
  end

  # POST /complex_services
  # POST /complex_services.xml
  def create
    @complex_service = ComplexService.new(params[:complex_service])

    respond_to do |format|
      if @complex_service.save
        format.html { redirect_to(@complex_service, :notice => 'ComplexService was successfully created.') }
        format.xml  { render :xml => @complex_service, :status => :created, :location => @complex_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @complex_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /complex_services/1
  # PUT /complex_services/1.xml
  def update
    @complex_service = ComplexService.find(params[:id])

    respond_to do |format|
      if @complex_service.update_attributes(params[:complex_service])
        format.html { redirect_to(@complex_service, :notice => 'ComplexService was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @complex_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /complex_services/1
  # DELETE /complex_services/1.xml
  def destroy
    @complex_service = ComplexService.find(params[:id])
    @complex_service.destroy

    respond_to do |format|
      format.html { redirect_to(complex_services_url) }
      format.xml  { head :ok }
    end
  end
 
end
