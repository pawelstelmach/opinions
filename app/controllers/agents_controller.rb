class AgentsController < ApplicationController
  # GET /agents
  # GET /agents.xml
  def index
    @page_id = "agents"
    @agents = Agent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agents }
    end
  end

  # GET /agents/1
  # GET /agents/1.xml
  def show
    @page_id = "agents"
    @agent = Agent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agent }
    end
  end

  # GET /agents/new
  # GET /agents/new.xml
  def new
    @page_id = "agents"
    @agent = Agent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agent }
    end
  end

  # GET /agents/1/edit
  def edit
    @page_id = "agents"
    @agent = Agent.find(params[:id])
  end

  # POST /agents
  # POST /agents.xml
  def create
    @agent = Agent.new(params[:agent])

    respond_to do |format|
      if @agent.save
        format.html { redirect_to(@agent, :notice => 'Agent was successfully created.') }
        format.xml  { render :xml => @agent, :status => :created, :location => @agent }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @agent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /agents/1
  # PUT /agents/1.xml
  def update
    @agent = Agent.find(params[:id])

    respond_to do |format|
      if @agent.update_attributes(params[:agent])
        format.html { redirect_to(@agent, :notice => 'Agent was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @agent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.xml
  def destroy
    @agent = Agent.find(params[:id])
    @agent.destroy

    respond_to do |format|
      format.html { redirect_to(agents_url) }
      format.xml  { head :ok }
    end
  end
  
  def parse_csv
    Agent.delete_all
    params[:csv].each_line do |line|
      a_name, a_belief, a_disbelief, a_uncertainty = line.strip.split(';')
      
      Agent.create( 
          :name => a_name,
          :belief => a_belief,
          :disbelief => a_disbelief,
          :uncertainty => a_uncertainty)
    end
    redirect_to agents_path
  end
  
end
