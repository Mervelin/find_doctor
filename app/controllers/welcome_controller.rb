class WelcomeController < ApplicationController

  def index
    @doctors = Doctor.all
  end

end
