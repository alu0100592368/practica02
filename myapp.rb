# my_app.rb
#
class MyApp
  def call env
    [200, {"Content-Type" => "text/html"}, ["Primera prueba utilizando Rack"]] 
  end
end