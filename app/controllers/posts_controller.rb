class PostsController < ApplicationController
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        respond_to do |f|
            if (@post.save)
                f.html { redirect_to '', notice: 'Post Created'}
            else
                f.html { redirect_to '', notice: 'Post Not Created'}
            end
        end
    end
    
    private
    def post_params # allow certain data to be passed via form
    params.require(:post).permit(:user_id, :content)
    end
end
