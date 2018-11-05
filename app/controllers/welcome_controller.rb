class WelcomeController < ApplicationController
  def index
  	@salas = Sala.all
  end
end
