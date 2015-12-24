class PeopleController < ApplicationController
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

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :notes)
  end
end
