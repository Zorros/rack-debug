require 'rack'

class Rack::Debug

  VERSION = '0.1.0'

  attr_reader :app

  def initialize(app, options={})
    @app = app
  end

  def call(env)
    LineCache::clear_file_cache
    Debugger.start_unix_socket_remote
    app.call(env)
  end

end
