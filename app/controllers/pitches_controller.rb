class PitchesController < ApplicationController
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
    
        set :method_override, :true
      end

      get '/pitches/results' do
        pitches = Pitch.all
        downcased_pitches = pitches.map do |pitch| 
            pitch.industry = pitch.industry.downcase
            pitch
        end
        @results = downcased_pitches.select do |pitch|
            pitch.industry == params[:search_industry].downcase
        end
        erb :'/pitches/results'
        end
    
      get '/pitches/index' do
        @pitches = Pitch.all
        erb :'pitches/index'
      end
    
      get '/pitches/new' do
        erb :'pitches/new'
      end
      
      get '/pitches/:id/edit' do
        @pitch = Pitch.all.find(params[:id])
        erb :'/pitches/edit'
      end
    
      get '/pitches/:id' do
        @pitch = Pitch.all.find(params[:id])
        erb :'pitches/show'
      end
    
      patch '/pitches/:id' do
        pitch = Pitch.find(params[:id])
        pitch.update(title: params[:title], industry: params[:industry], funding: params[:funding])
        redirect to("/pitches/#{pitch.id}")
      end
    
      post '/pitches' do 
        pitch = Pitch.create(name: params[:name], industry: params[:industry], funding: params[:funding])
        redirect to("/pitches/#{pitch.id}")
      end
    
      delete '/pitches/:id' do 
        Pitch.destroy(params[:id])
        redirect to("/pitches/index")
      end
    
end