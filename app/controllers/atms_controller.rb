class AtmsController < ApplicationController
  before_action :load_atm, only: [:destroy]
  respond_to :js, only: :search

  def index
    @atms = Atm.all
  end

  def new
    @atm = Atm.new
  end

  def create
    @atm = Atm.new(atm_params)
    if @atm.save
      redirect_to :atms, notice: 'Банкомат добавлен'
    else
      render action: :new
    end
  end

  def destroy
    @atm.destroy
    redirect_to :atms, notice: 'Банкомат удален'
  end

  def search
    @error_message = 'Неверные параметры поиска' if params[:lat].blank? || params[:lon].blank?
    srv = NearestAtmsFinderService.new(location: [params[:lat].to_f, params[:lon].to_f])
    @result = srv.()
    @cache_used = srv.cache_used
  end

  private

  def load_atm
    @atm = Atm.find params[:id]
  end

  def atm_params
    params.require(:atm).permit(:name, :lat, :lon)
  end
end