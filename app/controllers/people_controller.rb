class PeopleController < ApplicationController
  before_action :find_person, only: [:edit, :update, :destroy]
  
  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path, notice: 'The person has been created'
    else
      render :new
    end
  end

  def index
    @people = Person.all
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    if @person.update_attributes(person_params)
      redirect_to people_path, notice: 'Person has been updated.'
    end
  end

  def destroy
    @person.destroy
    rediect_to people_path, notice: 'Person has been deleted.'
  end

  private

  def find_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :notes)
  end
end
