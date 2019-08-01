#namespace
module Blog 
  
  class PostsController < BlogController

    # GET /posts
    # GET /posts.json
    def index
      # @posts = Post.all
      # custom order model 
      # apakah ada tag list 
      
      #if params[:tag].present?
      #  @posts = Post.most_recent.published.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 6) 
      #else
      #  @posts = Post.most_recent.published.paginate(:page => params[:page], :per_page => 6)
      #end 
      
      @posts = post_and_publish.list_for(params[:page], params[:tag])  

      # Post.paginate(:page => params[:page], :per_page => 30)
    end

    # GET /posts/1
    # GET /posts/1.json
    def show
      @post = post_and_publish.friendly.find(params[:id])
    end

    private 

    def post_and_publish 
      Post.published
    end

  end
  
end
