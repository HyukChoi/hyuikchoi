class HomeController < ApplicationController

  before_action :authenticate_user!,only:[:new,:create,:edit,:update,:destory]

  def index
    @posts = Post.all
  end

  def create
@user=User.find(current_user.id)
#종전의 코드였으나, 로그인 인강_3 11분 이 후 변경
#@post = Post.new
@post=@user.posts.new #(title:params[:title],writer:params[:writer],content:params[:content])


    @imgUploader = ImgUploader.new
    @imgUploader.store!(params[:img])



    @post.title = params[:title]
    @post.writer = params[:writer]
    @post.content = params[:content]

    @post.img_url=@imgUploader.url

    @post.save

    redirect_to"/"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to'/'

  end

  def read
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

  end

  def real_update
    @post = Post.find(params[:id])

    @post.title=params[:title]
    @post.writer=params[:writer]
    @post.content=params[:content]
    @post.img_url=params[:img]

    @post.save

    redirect_to'/'
  end

  #댓글 부분
def reply_mention
  #여기 @부분 reply가 해당됨

  #종전의 코드였으나, 로그인 인강_3 11분 이 후 변경하려했으나,  안되서 일단 이걸로
   @reply=Reply.new(post_id:params[:id], comment:params[:comment])

  #@user=User.find(current_user.id)
#  @reply=Reply.new(user_id: @user_id,post_id:params[:id], comment:params[:comment])

  @reply=@user.posts.replies.new(post_id:params[:id], comment:params[:comment])

   @reply.save

  redirect_to '/#temp_id'
  #redirect_to '/'
end

  def reply_destroy
    #여기 @부분 reply가 해당됨
    @reply=Reply.find(params[:id])
    @reply.destroy

    redirect_to '/'
  end

  def reply_update
    @posts2 = Post.all
    @reply3=Reply.find(params[:id])

  end

  def real_reply_update
    @reply4=Reply.find(params[:id])

    @reply4.comment=params[:updated_comment]

    @reply4.save

    redirect_to'/'


  end

end
