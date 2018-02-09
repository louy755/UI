class PeopleController < ApplicationController
skip_before_action :authenticate_user!
  # def index
  #   @people = Person.paginate(:page => params[:page], :per_page => 8)
  # end
  def index
    @filterrific = initialize_filterrific(
    Person,
      params[:filterrific]
    ) or return
    @people = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def show
    @person = Person.find(params[:id])
  end

  def enable
    @person = Person.find(params[:id])

    @person.toggle!(:enabled)
    key = @person.enabled? ? :success : :danger
    flash.now[key] = "#{@person.f_name}'s status successfully updated"
  end
end
