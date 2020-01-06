class Test2sController < ApplicationController
  # attribute :t1, :string
  before_action :set_test2, only: [:show, :edit, :update, :destroy]

  # GET /test2s
  # GET /test2s.json
  def index
    @test2s = Test2.all
  end

  # GET /test2s/1
  # GET /test2s/1.json
  def show
  end

  # GET /test2s/new
  def new
    @test2 = Test2.new
  end

  # GET /test2s/1/edit
  def edit
  end

  # POST /test2s
  # POST /test2s.json
  def create
    @test2 = Test2.new({"t1"=>test2_params[:t1], "t2"=>test2_params[:t2], "encrypted_t2_string"=>SymmetricEncryption.encrypt(test2_params[:encrypted_t2_string])})
    respond_to do |format|
      if @test2.save
        format.html { redirect_to @test2, notice: 'Test2 was successfully created.' }
        format.json { render :show, status: :created, location: @test2 }
      else
        format.html { render :new }
        format.json { render json: @test2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test2s/1
  # PATCH/PUT /test2s/1.json
  def update
    respond_to do |format|
      if @test2.update({"t1"=>test2_params[:t1], "t2"=>test2_params[:t2], "encrypted_t2_string"=>SymmetricEncryption.encrypt(test2_params[:encrypted_t2_string])})
        format.html { redirect_to @test2, notice: 'Test2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @test2 }
      else
        format.html { render :edit }
        format.json { render json: @test2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test2s/1
  # DELETE /test2s/1.json
  def destroy
    @test2.destroy
    respond_to do |format|
      format.html { redirect_to test2s_url, notice: 'Test2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test2
      @test2 = Test2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test2_params
      params.require(:test2).permit(:t1, :t2, :encrypted_t2_string)
    end
end
