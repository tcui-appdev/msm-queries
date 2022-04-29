class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all
    render({:template => "directors_templates/index.html.erb"})
  end

  def eldest
    @oldest = Director.where.not({:dob => nil})
      .order({:dob => :asc})[0]
    render({:template => "directors_templates/eldest.html.erb"})
  end

  def youngest
    @youngest = Director.where.not({:dob => nil})
    .order({:dob => :desc})[0]
    render({:template => "directors_templates/youngest.html.erb"})
  end

  def director_details
    the_id = params.fetch("id")
    @the_director = Director.where({:id => the_id})[0]
    @filmography = Movie.where({:director_id => @the_director.id})
    render({:template => "directors_templates/show.html.erb"})
  end
end
