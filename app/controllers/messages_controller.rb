class MessagesController < ApplicationController
  # User needs to be authenticated to see ANY messages in chatroom:
  before_action :authenticate_user #, except: [:index, :show]
  before_action :set_message, only: [:show, :update, :destroy] #before showing message, find it by id.
  before_action :check_ownership, only: [:destroy, :update]

  # GET /messages or /messages.json
  def index
    # @messages = Message.all      #NOT ORDERED
    @messages = []
    if (params[:username]) #return all messages for this username & order messages by most recent message on top
      @messages = Message.find_by_user(params[:username]).order('updated_at DESC') 
    else #return all messages for all users
      Message.order('updated_at DESC').each do |msg|
        @messages << Message.find_by(id: msg.id).transform_message
      end
    end
    render json: @messages
  end

  # GET /messages/1 or /messages/1.json
  def show
    render json: @message.transform_message
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages or /messages.json
  def create
    # @message = Message.create(message_params)
    @message = current_user.messages.create(message_params)
    if @message.errors.any?
      render json: @message.errors, status: :unprocessable_entity
    else
      render json: @message, status: 201
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    @message.update(message_params)
    if @message.errors.any?
      render json: @message.errors, status: :unprocessable_entity
    else
      render json: @message, status: 200 #successful response for put. https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.delete
    render json: {message: "Message successfully deleted."}, status: 204
  end

  def check_ownership
     if !current_user.isAdmin
        if current_user.id != @message.user.id
            render json: {error: "You are not authorized to continue with this action."}
        end
     end
  end

  #Find all messages for current user & order messages by most recent message on top
  def my_messages 
    @messages = [] #see index above. not dry. has to go one by one and is therefore not effective. Replace with function in model.
    Message.find_by_user(current_user.username).order('updated_at DESC').each do |msg| 
      @messages << Message.find_by(id: msg.id).transform_message
    end
    render json: @messages
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_message # not private: taken out of private for accessibility. Find message by id.
    begin
      @message = Message.find(params[:id])
    rescue
      render json: {error: "The message you are looking for does not exist"}, status: 404
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:m_text, :user_id, :card_id)
  end
end