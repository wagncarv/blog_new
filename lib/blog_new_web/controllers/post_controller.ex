defmodule BlogNewWeb.PostController do
  use BlogNewWeb, :controller

  alias BlogNew.Posts.{Get, Post}

  def index(conn, _params) do
    posts = Get.all()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Get.by_id(id)
    render(conn, "show.html", post: post)
  end

  def new(conn, params) do
    changeset = Post.changeset(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, _params) do
    # render(conn, "new.html")
  end
end
