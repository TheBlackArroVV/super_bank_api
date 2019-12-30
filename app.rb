require 'roda'

class App < Roda
  route do |r|
    r.root do
      render json: "Hello World!"
    end
  end
end

run App.freeze.app
