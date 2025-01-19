class PingsController < ApplicationController
  def ping
    render json: { hello: 'World!' }
  end
end
