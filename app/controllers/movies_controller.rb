class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all
    
    render({:template => "movies_templates/index.html.erb"})
  end

  def movie_details
    the_id = params.fetch("id")
    @the_movie = Movie.where({:id => the_id})[0]
    @the_director = Director.where({:id => @the_movie.director_id})[0].name

    render({:template => "movies_templates/show.html.erb"})
  end
end
