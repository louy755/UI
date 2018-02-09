module PeopleHelper
  def full_name
    @person.f_name.titleize  + " " + @person.l_name.titleize 
  end
end
