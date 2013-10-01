require 'rack'
require 'twitter'
require './configure'

class Twittapp

  def call env
    req = Rack::Request.new(env)
    res = Rack::Response.new 
    res['Content-Type'] = 'text/html'
    username = (req["user"] && req["user"] != '') ? req["user"] :''
    user_tweets = (!username.empty?) ? usuario_registrado?(username) : "Introduzca un usuario de twitter"
    res.write <<-"EOS"
      <!DOCTYPE HTML>
      <html>
        <title>TwittApp</title>
        <body>
          <section>

            <form action="/" method="post">
              Introducir usuario <input type="text" name="user" autofocus><br>
              <input type="submit" value="Mostrar tweets">
            </form>
          </section>
          
          <section>
            <h2>El ultimo tweet deberia mostrarse</h2>
            Usuario: #{username}
            <br>
            Ultimo tweet: #{user_tweets}
          </section>
        </body>
      </html>
    EOS
    res.finish
  end

  def usuario_registrado?(user)
    begin
    	Twitter.user_timeline(user).first.text
    	rescue
      	"Error: ¡El usuario introducido no tiene una cuenta en Twitter!"
    end
  end
end

Rack::Server.start(
  :app => Twittapp.new,
  :Port => 9292,
  :server => 'thin'
)