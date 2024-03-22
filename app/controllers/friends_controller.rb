class FriendsController < ApplicationController
  before_action :authenticate_user!

  # GET /friends or /friends.json
  def index
   @friends = Friend.where(user_id: current_user.id)
  end

  # GET /friends/1 or /friends/1.json
  def show
    @friend = Friend.find(params[:id])
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
      @friend = Friend.find(params[:id]) 
  end

  # POST /friends or /friends.json
  def create
    @friend = Friend.new(friend_params)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @friend = Friend.find(params[:id])
  
    respond_to do |format|
      if @friend.update(friend_params)
        puts "Setting flash message for HTML format"
        format.html { redirect_to friend_url(@friend), notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy!
  
    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
