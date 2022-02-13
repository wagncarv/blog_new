defmodule BlogNewWeb.PostController do
  use BlogNewWeb, :controller

  alias BlogNew.Posts.{Create, Delete, Get, Post}

  def index(conn, _params) do
    posts = Get.all()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Get.by_id(id)
    render(conn, "show.html", post: post)
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    post = Get.by_id(id)
    changeset = Post.changeset(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def create(conn, %{"post" => post}) do
    case Create.create(post) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post criado com sucesso")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Get.by_id(id)
    _response = Delete.delete(post)

    conn
    |> put_flash(:info, "Post '#{post.title}' excluído!")
    |> redirect(to: Routes.post_path(conn, :index))
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = BlogNew.Repo.get!(Post, id)
    changeset = Post.changeset(post, post_params)
    post = BlogNew.Repo.update(changeset)

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
