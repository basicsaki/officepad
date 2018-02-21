class NoticeBoardsController < ApplicationController
  before_action :set_notice_board, only: [:show, :edit, :update, :destroy]

  # GET /notice_boards
  # GET /notice_boards.json
  def index
    @notice_boards = NoticeBoard.all
  end

  # GET /notice_boards/1
  # GET /notice_boards/1.json
  def show
  end

  # GET /notice_boards/new
  def new
    @notice_board = NoticeBoard.new
  end

  # GET /notice_boards/1/edit
  def edit
  end

  # POST /notice_boards
  # POST /notice_boards.json
  def create
    @notice_board = NoticeBoard.new(notice_board_params)

    respond_to do |format|
      if @notice_board.save
        format.html { redirect_to @notice_board, notice: 'Notice board was successfully created.' }
        format.json { render :show, status: :created, location: @notice_board }
      else
        format.html { render :new }
        format.json { render json: @notice_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notice_boards/1
  # PATCH/PUT /notice_boards/1.json
  def update
    respond_to do |format|
      if @notice_board.update(notice_board_params)
        format.html { redirect_to @notice_board, notice: 'Notice board was successfully updated.' }
        format.json { render :show, status: :ok, location: @notice_board }
      else
        format.html { render :edit }
        format.json { render json: @notice_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notice_boards/1
  # DELETE /notice_boards/1.json
  def destroy
    @notice_board.destroy
    respond_to do |format|
      format.html { redirect_to notice_boards_url, notice: 'Notice board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice_board
      @notice_board = NoticeBoard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_board_params
      params.require(:notice_board).permit(:user_id, :name, :description)
    end
end
