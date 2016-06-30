class FavoriteMailer < ApplicationMailer
  default from: "jhafner1990@gmail.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@infinite-wave-17176.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@infinite-wave-17176.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@infinite-wave-17176.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
