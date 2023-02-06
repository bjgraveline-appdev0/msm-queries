class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render({ :template => "director_templates/index.html.erb"})
  end
  
  def oldest
    @oldest_director = Director.where.not({ :dob => nil }).order({ :dob => :asc}).at(0)
    render({ :template => "director_templates/eldest.html.erb"})
  end

  def youngest
    @youngest_director = Director.where.not({ :dob => nil }).order({ :dob => :desc}).at(0)
    render({ :template => "director_templates/youngest.html.erb"})
  end

  def director_details
    @the_director = Director.where({:id => params.fetch("an_id")}).at(0)
    @filmography = Movie.where({ :director_id => @the_director.id})
    render({ :template => "director_templates/show.html.erb"})
  end
end
