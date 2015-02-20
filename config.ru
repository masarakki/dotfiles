require 'sinatra'

get '/' do
  content_type :text
  File.read 'setup.sh'
end

run Sinatra::Application
