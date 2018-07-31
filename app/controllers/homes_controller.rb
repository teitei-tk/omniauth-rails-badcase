class HomesController < ApplicationController
  def index
  end

  def valid
    @model = nil
  end

  def invalid
    render action: :valid
  end
end
