class MessagesController < ApplicationController
  # User needs to be authenticated to see ANY messages in chatroom:
  before_action :authenticate_user
  #  before_action :authenticate_user, except: [:index, :show]
  before_action :set_message, only: %i[ show update destroy ] 
  #before_action :set_message, only: [:show, :update, :destroy] #before showing message, find it by id.
  before_action :check_ownership, only: [:destroy, :update]

  # GET /messages or /messages.json
  def index
    # @messages = Message.all
    # render json: @messages
    # @messages = Message.all      #NOT ORDERED
    @messages = Message.order('updated_at DESC') # Can INSTEAD, order messages by most recent message on top
    render json: @messages
  end

  # GET /messages/1 or /messages/1.json
  def show
    render json: @message
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  # def edit
  # end

  # POST /messages or /messages.json
  def create
    # @message = Message.new(message_params)
    # # @message = current_user.messages.create(message_params)
    # respond_to do |format|
    #   if @message.save
    #     format.html { redirect_to @message, notice: "Message was successfully created." }
    #     format.json { render :show, status: :created, location: @message }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @message.errors, status: :unprocessable_entity }
    #   end
    # end

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
    # respond_to do |format|
    #   if @message.update(message_params)
    #     format.html { redirect_to @message, notice: "Message was successfully updated." }
    #     format.json { render :show, status: :ok, location: @message }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @message.errors, status: :unprocessable_entity }
    #   end
    # end
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
    # respond_to do |format|
    #   format.html { redirect_to messages_url, notice: "Message was successfully deleted." }
    #   format.json { head :no_content }
    # end
  end

  def check_ownership
    # if !current_user.isAdmin
        if current_user.id != @message.user.id
            render json: {error: "You are not authorized to continue with this action."}
        end
    # end
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