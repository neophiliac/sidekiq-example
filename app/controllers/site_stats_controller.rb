class SiteStatsController < ApplicationController
  before_action :set_site_stat, only: [:show, :edit, :update, :destroy]

  # GET /site_stats
  # GET /site_stats.json
  def index
    @site_stats = SiteStat.all
  end

  # GET /site_stats/1
  # GET /site_stats/1.json
  def show
  end

  # GET /site_stats/new
  def new
    @site_stat = SiteStat.new
  end

  # GET /site_stats/1/edit
  def edit
  end

  # POST /site_stats
  # POST /site_stats.json
  def create
    @site_stat = SiteStat.new(site_stat_params)

    respond_to do |format|
      if @site_stat.save
        format.html { redirect_to action: 'index', notice: 'Site stat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site_stat }
      else
        format.html { render action: 'new' }
        format.json { render json: @site_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_stats/1
  # PATCH/PUT /site_stats/1.json
  def update
    respond_to do |format|
      if @site_stat.update(site_stat_params)
        format.html { redirect_to action: 'index', notice: 'Site stat was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @site_stat }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_stats/1
  # DELETE /site_stats/1.json
  def destroy
    @site_stat.destroy
    respond_to do |format|
      format.html { redirect_to site_stats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_stat
      @site_stat = SiteStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_stat_params
      params.require(:site_stat).permit(:url, :page)
    end
end
