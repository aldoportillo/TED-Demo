class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @people = Person.order(views_count: :desc)
    @top_three = Person.order(views_count: :desc).limit(3)
  end

  # GET /people/1 or /people/1.json
  def show
    @person = Person.find(params[:id])
  
    unless cookies["person_#{@person.id}_viewed"]
      @person.increment!(:views_count)
      cookies["person_#{@person.id}_viewed"] = { value: true, expires: 1.hour.from_now }
    end
  
    respond_to do |format|
      format.html 
      format.json { render json: @person }
    end
  end
  

  # GET /people/new

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "Person was successfully created." }
        format.json { render json: { person: @person, qr_code: @person.qr_code }, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy!

    respond_to do |format|
      format.html { redirect_to people_path, status: :see_other, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :email, :github_username, :quiz_result, :linkedin_url, :photo_url)
    end

    def set_person
      @person = Person.find(params[:id])
    end
end
