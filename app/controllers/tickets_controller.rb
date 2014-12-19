
class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
    
  # GET /tickets
  # GET /tickets.json
  def index
    user_id = 1
    
    user = find_user_by_id(user_id)
    @ticket_list = get_current_user_ticket_list(user)
    
    render json: @ticket_list
  end
  
  def find_user_by_id(user_id)
    User.find(user_id)
  end
  
  def get_current_user_ticket_list (user)
    
    user_ticket_list = get_current_user_ticket_list (user)
    
    ticket_list = []
    user_ticket_list.each do |user_ticket|
      ticket = TicketsHelper::Ticket.new
      ticket.store_id = user_ticket.store.id
      ticket.store_name = user_ticket.store.name
      ticket.reg_time = user_ticket.created_at
      ticket.wait_number = user_ticket.cnt
      ticket.wait_ahead_count = get_current_user_wait_ahead_count(user_ticket)
      ticket_list << ticket;
    end
    
    return ticket_list
  end
  
  def get_current_user_ticket_list (user)
    user.tickets
  end
  
  def get_current_user_wait_ahead_count (user_ticket)
    all_waiting_users = get_store_all_waiting_users (user_ticket.store)
    calc_order_to_current_user user_ticket, all_waiting_users 
  end
  
  def get_store_all_waiting_users (store)
    store.tickets
  end
  
  def calc_order_to_current_user(user_ticket, all_waiting_users)
    all_waiting_users.where("id <= ?", user_ticket.id).count
  end
  

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:user_id, :store_id, :number, :person_cnt, :check_in)
    end
end
