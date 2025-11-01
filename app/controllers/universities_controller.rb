class UniversitiesController < ApplicationController
  before_action :set_university, only: %i[ show edit update destroy ]

  # GET /universities or /universities.json
def index
  @q = params[:q]

  if @q.present?
    query = "%#{@q.downcase}%"
    @universities = University.where("LOWER(name) LIKE ? OR LOWER(country) LIKE ?", query, query)
  else
    @universities = University.all
  end

  @universities = @universities.order(:name).page(params[:page]).per(10)
end



  # GET /universities/1 or /universities/1.json
  def show
  end

  # GET /universities/new
  def new
    @university = University.new
  end

  # GET /universities/1/edit
  def edit
  end

  # POST /universities or /universities.json
  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.html { redirect_to @university, notice: "University was successfully created." }
        format.json { render :show, status: :created, location: @university }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universities/1 or /universities/1.json
  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to @university, notice: "University was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @university }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universities/1 or /universities/1.json
  def destroy
    @university.destroy!

    respond_to do |format|
      format.html { redirect_to universities_path, notice: "University was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university
      @university = University.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def university_params
      params.require(:university).permit(:name, :country)
    end
end
class UniversitiesController < ApplicationController
  before_action :set_university, only: %i[ show edit update destroy ]

  # GET /universities or /universities.json
  def index
    @universities = University.all

    # 🔍 Simple Search (Feature 4.1)
    if params[:q].present?
      @universities = @universities.where("name LIKE ?", "%#{params[:q]}%")
    end

    # 📋 Order alphabetically
    @universities = @universities.order(:name)

    # 📄 Pagination using Kaminari (Feature 3.5)
    @universities = @universities.page(params[:page]).per(10)
  end

  # GET /universities/1 or /universities/1.json
  def show
    # Includes associated Programs (Feature 3.3)
    @programs = @university.programs.order(:name)
  end

  # GET /universities/new
  def new
    @university = University.new
  end

  # GET /universities/1/edit
  def edit
  end

  # POST /universities or /universities.json
  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.html { redirect_to @university, notice: "University was successfully created." }
        format.json { render :show, status: :created, location: @university }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universities/1 or /universities/1.json
  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to @university, notice: "University was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @university }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universities/1 or /universities/1.json
  def destroy
    @university.destroy!

    respond_to do |format|
      format.html { redirect_to universities_path, notice: "University was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_university
      @university = University.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def university_params
      params.require(:university).permit(:name, :country)
    end
end
