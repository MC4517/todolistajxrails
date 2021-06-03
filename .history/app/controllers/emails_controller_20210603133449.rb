class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy ]

  # GET /emails or /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1 or /emails/1.json
  def show
    respond_to do |format|
        format.html { redirect_to root_path }
        format.js {}
end
end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails or /emails.json
  def create
    @email = Email.new(
      object: Faker::Book.title,
      body: Faker::Book.genre
    )



    respond_to do |format|
      if @email.save
        format.html { redirect_to email_url, notice: "Email was successfully created." }
        format.json { render :show, status: :created, location: @email }
        format.js {}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1 or /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to root, notice: "Email was successfully updated." }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1 or /emails/1.json
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: "Email supprimé." }
      format.json { head :no_content }
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:object, :body)
    end
end
