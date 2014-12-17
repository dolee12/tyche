
class LineupsController < ApplicationController
  before_action :set_lineup, only: [:show, :edit, :update, :destroy]
    
  # GET /lineups
  # GET /lineups.json
  def index
    user_id = 50
    
    user = find_user_by_id(user_id)
    @ticket_list = get_current_user_ticket_list(user)
    
    render json: @ticket_list
  end
  
  def find_user_by_id(user_id)
    User.find(user_id)
  end
  
  def get_current_user_ticket_list (user)
    
    user_lineup_list = get_current_user_lineup_list (user)
    
    ticket_list = []
    user_lineup_list.each do |user_lineup|
      ticket = LineupsHelper::Ticket.new
      ticket.store_id = user_lineup.store.id
      ticket.store_name = user_lineup.store.name
      ticket.reg_time = user_lineup.created_at
      ticket.wait_number = user_lineup.cnt
      ticket.wait_ahead_count = get_current_user_wait_ahead_count(user_lineup)
      ticket_list << ticket;
    end
    
    return ticket_list
  end
  
  def get_current_user_lineup_list (user)
    user.lineups
  end
  
  def get_current_user_wait_ahead_count (user_lineup)
    all_waiting_users = get_store_all_waiting_users (user_lineup.store)
    calc_order_to_current_user user_lineup, all_waiting_users 
  end
  
  def get_store_all_waiting_users (store)
    store.lineups
  end
  
  def calc_order_to_current_user(user_lineup, all_waiting_users)
    all_waiting_users.where("id <= ?", user_lineup.id).count
  end
  

  # GET /lineups/1
  # GET /lineups/1.json
  def show
  end

  # GET /lineups/new
  def new
    @lineup = Lineup.new
  end

  # GET /lineups/1/edit
  def edit
  end

  # POST /lineups
  # POST /lineups.json
  def create
    @lineup = Lineup.new(lineup_params)

    respond_to do |format|
      if @lineup.save
        format.html { redirect_to @lineup, notice: 'Lineup was successfully created.' }
        format.json { render :show, status: :created, location: @lineup }
      else
        format.html { render :new }
        format.json { render json: @lineup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lineups/1
  # PATCH/PUT /lineups/1.json
  def update
    respond_to do |format|
      if @lineup.update(lineup_params)
        format.html { redirect_to @lineup, notice: 'Lineup was successfully updated.' }
        format.json { render :show, status: :ok, location: @lineup }
      else
        format.html { render :edit }
        format.json { render json: @lineup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lineups/1
  # DELETE /lineups/1.json
  def destroy
    @lineup.destroy
    respond_to do |format|
      format.html { redirect_to lineups_url, notice: 'Lineup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lineup
      @lineup = Lineup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lineup_params
      params.require(:lineup).permit(:user_id, :store_id, :number, :person_cnt, :check_in)
    end
end
