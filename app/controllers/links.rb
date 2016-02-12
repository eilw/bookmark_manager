
class BookmarkManager < Sinatra::Base



  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  get '/tags/:tag' do
    @tag = params[:tag]
    @links = Tag.all(tag: @tag).links
    erb :tags
  end

  post '/links' do
    link = Link.create(:title => params[:title], :url => params[:url])
    params[:tag].split(',').each do |tag|
      tagg = Tag.create(tag: tag)
      link.tags << tagg
      link.save
    end
    redirect '/links'
  end

end
