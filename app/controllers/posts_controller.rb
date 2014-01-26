class PostsController < ApplicationController
  before_filter :authenticate_user!
  expose_decorated(:posts) { Post.all }
  expose_decorated(:post, attributes: :post_params)
  expose(:tag_cloud) { get_tags_cloud}
  # expose(:tag_cloud) { Post.all.last.tags_array}

  def index

  end

  def new
  end

  def edit
  end

  def update
    if post.save
      render action: :index
    else
      render :new
    end
  end

  def destroy
    post.destroy if current_user.owner? post
    render action: :index
  end

  def show
    @comments = post.comments
  end

  def mark_archived
    # post = Post.find params[:id]
    post.archive!
    render action: :index
  end

  def create
    if post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def comments
  end

  private

  def post_params
    return if %w{mark_archived}.include? action_name
    params.require(:post).permit(:body, :title, :tags)
  end

  def get_tags_cloud
    main_array=[]
    for post in posts
      for tag in post.tags_array
        main_array << tag 
      end
    end
    freq = main_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    tags_occure=[]  
    freq.each do |k, v|
      tags_occure.unshift([k,v.to_f])
    end
    tags_occure
  end
end
