defmodule BlogNewWeb.PostController do
  use BlogNewWeb, :controller

  alias BlogNew.Posts.Get

  def index(conn, _params) do
    posts = Get.all()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Get.by_id(id)
    render(conn, "show.html", post: post)
  end
end
