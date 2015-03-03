require 'sinatra'
require 'sinatra/reloader' if development?
require "yaml"

require_relative './models/base60'

helpers do
  def find_file_with(args)
    if args[:short_uid]
      posts = Dir["./posts/*"].map { |post_file| YAML.load_file post_file }
      post = posts.detect { |post| post["short_id"] == args[:short_uid] }
      return post["content"] if post["content"]
    end

    "404 Content Not Found"
  end
end

get '/' do
  "hello"
end

get '/short/:base_60_id' do
  content = find_file_with short_uid: params[:base_60_id]

  "You gave me the short id of #{params[:base_60_id]}" +
  " which corresponds to #{Base60.decode params[:base_60_id]}." +
  " Its content is: #{content}."
end
