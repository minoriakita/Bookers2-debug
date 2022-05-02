class BookCommentsController < ApplicationController
  def create
    @book_comment = BookComment.new
    @user = current_user
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.save
    render :book_comment

  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    BookComment.find(params[:id]).destroy
    render :book_comment_destroy
  end

 private

 def book_comment_params
   params.require(:book_comment).permit(:comment)
 end

end