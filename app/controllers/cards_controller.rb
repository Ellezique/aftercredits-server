class CardsController < ApplicationController
  before_action :set_card, only: %i[ show edit update destroy ]

  # GET /cards or /cards.json
  def index
    # @cards = Card.all INSTEAD, order cards by most recent card created:
    @cards = Card.order('updated_at DESC')
    render json: @cards
  end

  # GET /cards/1 or /cards/1.json
  def show
    render json: @card
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  # def edit
  # end

  # POST /cards or /cards.json
  def create
    # @card = Card.new(card_params)
  #   respond_to do |format|
  #     if @card.save
  #       format.html { redirect_to @card, notice: "Movie/Series Card was successfully created." }
  #       format.json { render :show, status: :created, location: @card }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @card.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  @card = Card.create(card_params)
    if @card.errors.any?
      render json: @card.errors, status: :unprocessable_entity
    else
      render json @card, status: 201
    end
  end

  # private 
  # def card_params
  #   params.require(:card).permit(:imdb_id)
  # end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    # respond_to do |format|
    #   if @card.update(card_params)
    #     format.html { redirect_to @card, notice: "Movie/Series Card was successfully updated." }
    #     format.json { render :show, status: :ok, location: @card }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @card.errors, status: :unprocessable_entity }
    #   end
    # end
    @card.update(card_params)
    if @card.errors.any?
      render json: @card.errors, status: :unprocessable_entity
    else
      render json: @card, status: 201
    end
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    # @card.delete
    # respond_to do |format|
    #   format.html { redirect_to cards_url, notice: "Movie/Series Card was successfully deleted." }
    #   format.json { head :no_content }
    # end
    @card.delete
    render json: {messsage: "Message deleted"}, status: 204
  end

 
    # Find and set card by id
    def set_card  # not private: taken out of private for accessibility
      begin
        @card = Card.find(params[:id])
      rescue
        render json: {error: "The movie or series that you are looking for does not exist "}, status: 404
      end
    end

    private 
    # Only allow a list of trusted parameters through.
    def card_params #Card params are set to private to prevent access from the outside
      params.require(:card).permit(:imdb_id)
    end
end