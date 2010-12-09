class OpinionsController < ApplicationController
  protect_from_forgery :except => [:get_opinion]
  # GET /opinions
  # GET /opinions.xml
  def index
    @page_id = "opinions"
    @opinions = Opinion.all
    services = Service.find(:all)
    agents = Agent.all
    @agents_list = agents.collect {|item| [ item.name, item.id ]}
    @agents_table = agents.inject({}) {|h,i| h[i.id] = i.name; h}
    @services_list = services.collect {|item| [ item.name, item.id ]}
    @services_table = services.inject({}) {|h, i| h[i.id] = i.name; h}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opinions }
    end
  end

  def recommend
	@opinion = Opinion.find(params[:id])
	#<bA*bS, bA*dS, dA + uA + bA*uS>
	@recommendation = @opinion.recommend
  end
  
  # GET /opinions/1
  # GET /opinions/1.xml
  def show
    @page_id = "opinions"
    @opinion = Opinion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opinion }
    end
  end

  # GET /opinions/new
  # GET /opinions/new.xml
  def new
    @page_id = "opinions"
    @opinion = Opinion.new
    @agents = Agent.all.collect {|item| [ item.name, item.id ]}
    @services = Service.find(:all).collect {|item| [ item.name, item.id ]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opinion }
    end
  end

  # GET /opinions/1/edit
  def edit
    @page_id = "opinions"
    @opinion = Opinion.find(params[:id])
    @agents = Agent.all.collect {|item| [ item.name, item.id ]}
    @services = Service.find(:all).collect {|item| [ item.name, item.id ]}
  end

  # POST /opinions
  # POST /opinions.xml
  def create
    @opinion = Opinion.new(params[:opinion])

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to(opinions_path, :notice => 'Opinion was successfully created.') }
        format.xml  { render :xml => @opinion, :status => :created, :location => @opinion }
      else
        format.html { render :action => "opinions_path" }
        format.xml  { render :xml => @opinion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /opinions/1
  # PUT /opinions/1.xml
  def update
    @opinion = Opinion.find(params[:id])

    respond_to do |format|
      if @opinion.update_attributes(params[:opinion])
        format.html { redirect_to(@opinion, :notice => 'Opinion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opinion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.xml
  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy

    respond_to do |format|
      format.html { redirect_to(opinions_url) }
      format.xml  { head :ok }
    end
  end
  
    def parse_csv
    Opinion.delete_all
    agents = Agent.all
    agents_table = agents.inject({}) {|h,i| h[i.name] = i.id; h}
    services = Service.find(:all)
    services_table = services.inject({}) {|h, i| h[i.name] = i.id; h}
    params[:csv].each_line do |line|
      o_agent, o_service, o_belief, o_disbelief, o_uncertainty = line.strip.split(';')
      
      Opinion.create( 
          :agent_id => agents_table[o_agent],
          :service_id => services_table[o_service],
          :belief => o_belief,
          :disbelief => o_disbelief,
          :uncertainty => o_uncertainty)
    end
    redirect_to opinions_path
  end

def get_opinion
    atomic_service_array = Hash.from_xml(params["complex_service"])['services'].to_a
    #atomic_service_array = Hash.from_xml("<?xml version=\"1.0\" encoding=\"UTF-8\"?><services><service><id>1</id></service><service><id>2</id></service><service><id>3</id></service></services>")['services']['service'].to_a.flatten
    
    complex_service = Array.new
    atomic_service_array.each do |item|
      complex_service << Service.find(item["id"])
    end
    
    @opinion = ComplexService.get_opinion_about(complex_service)
    render 'get_opinion.xml.erb'
  end
end
