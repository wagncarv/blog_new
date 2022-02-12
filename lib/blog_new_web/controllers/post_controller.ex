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

  def edit(conn, %{"id" => id}) do
    post = BlogNew.Repo.get!(Post, id)
    changeset = Post.changeset(%Post{}, post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def create(conn, %{"post" => post}) do
    post = Post.changeset(%Post{}, post)
    |> BlogNew.Repo.insert()

    case post do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post criado com sucesso")
        |> redirect(to: Routes.post_path(conn, :show, post))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = BlogNew.Repo.get!(Post, id)
    _response = BlogNew.Repo.delete!(post)

    conn
    |> put_flash(:info, "Post '#{post.title}' excluído!")
    |> redirect(to: Routes.post_path(conn, :index))
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = BlogNew.Repo.get!(Post, id)
    post = BlogNew.Repo.update(post, post_params)

    case post do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post atualizado com sucesso")
        |> redirect(to: Routes.post_path(conn, :show, post))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
