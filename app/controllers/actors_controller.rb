class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
    
    render({:template => "actors_templates/index.html.erb"})
  end

  def actor_details
    the_id = params.fetch("id")
    @the_actor = Actor.where({:id => the_id})[0]
    @characters = Character.where({:actor_id => @the_actor.id})
    


    render({:template => "actors_templates/show.html.erb"})
  end
end
