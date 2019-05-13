require 'open-uri'
require 'json'

class GameController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
    cookies[:user_score] = 0 if cookies[:user_score].nil?
  end

  def scores
    if params[:user_word].nil?
      @result = 'Please enter at least one letter'
    elsif !includes?
      @result = "Your word #{params[:user_word]} is not included in the grid #{params[:letters]}"
    elsif includes? && valid?
      @result = "Well done #{params[:user_word]} works. Your score is #{params[:user_word].length}"
      p cookies[:user_score].class
      p params[:user_word].length.class
      cookies[:user_score] = cookies[:user_score].to_i + params[:user_word].length if !cookies.nil?
    elsif includes? && !valid?
      @result = "Your word #{params[:user_word]} is not a real word"
    end
  end

  def valid?
    url = "https://wagon-dictionary.herokuapp.com/#{params[:user_word]}"
    response = open(url).read
    document = JSON.parse(response)
    document['found']
  end

  def includes?
    params[:letters].downcase.split
    params[:user_word].downcase.split('')
    d = params[:user_word].downcase.split('') - params[:letters].downcase.split
    d.empty?
  end
end
