class MenusController < ApplicationController
  before_filter :authenticate_user!

  # GET /menus
  # GET /menus.json
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Menu.event_strips_for_month(@shown_month)
  end

  # GET /menus/:year/:month/:day
  def show
    @date = Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
    @menus = current_user.menus.day(@date)
  end

  def create
    @menu = current_user.menus.build(menu_params)

    if @menu.save
      redirect_to @menu.day_path, notice: 'Menu was successfully created.'
    else
      redirect_to :root
    end
  end

  def update
    @menu = current_user.menus.find(params[:id])

    if @menu.update_attributes(menu_params)
      redirect_to @menu.day_path, notice: 'Menu was successfully updated.'
    else
      redirect_to @menu.day_path
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu = current_user.menus.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example: params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def menu_params
      params.require(:menu).permit(:staple_recipe_id, :main_recipe_id, :side_recipe_id, :comment, :photo)
    end
end
