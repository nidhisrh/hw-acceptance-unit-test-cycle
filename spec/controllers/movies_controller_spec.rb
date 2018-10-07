require 'rails_helper'
require 'spec_helper'

describe MoviesController do
  describe 'Get list of all movies by same director' do
    before :each do
      movies = [{:title => 'Star Wars', :rating => 'PG',
  	           :director => 'George Lucas', :release_date => '1977-05-25'},
    	        {:title => 'Alien', :rating => 'PG', 
  	           :director => '', :release_date => '1977-05-25'},
  	           {:title => 'ThX-1138', :rating => 'R', :director => "George Lucas",:release_date => '1977-05-25'},
  	           {:title => 'Blade Runner', :rating => 'PG', :director => "Ridley Scott",:release_date => '1977-05-25'}
  	 ]
      movies.each do |movie|
          Movie.create movie
      end
      @results = [movies[1],movies[3]]
    end 
    context 'when the specified movie has a director' do
      it 'should get the director name for the particular movie and find all movies with same director' do
        expect(Movie).to receive(:get_all_movies_by_director).with("1").
          and_return(@results)
        get :director, {:id => "1"}
      end
    end
    context 'when the specified movie has no director' do
      it 'redirect to home page when the movie does not have any director' do
        get :director, {:id => 2}
        expect(response).to redirect_to '/movies'
      end
    end
  end
end