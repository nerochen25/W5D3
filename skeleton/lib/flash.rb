require 'json'

class Flash
  def initialize(req)
    @req = req
    @data = {}
  end
  
  def []=(key, value)
    @data[key] = value
  end
  
  def [](key)
    p @data[:cookie]
    @data[key]
  end
  
  def store_flash(res)
    res.set_cookie('_rails_lite_app_flash', value: @data.to_json, path: '/')
  end
end
