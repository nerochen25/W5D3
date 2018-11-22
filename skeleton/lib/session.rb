require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    # @app_cookie = req.cookies['_rails_lite_app']
    cookie = req.cookies['_rails_lite_app']
    if cookie
      @app_cookie = JSON.parse(cookie)
    else
      @app_cookie = {}
    end
  end

  def [](key)
    @app_cookie[key]
  end

  def []=(key, val)
    @app_cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookie = { path: '/', value: @app_cookie.to_json }
    res.set_cookie('_rails_lite_app', cookie)
  end
end
