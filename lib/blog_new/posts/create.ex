defmodule BlogNew.Posts.Create do
  alias BlogNew.Posts.Post
  alias BlogNew.Repo

  def create(attrs \\ %{}) do
    Post.changeset(%Post{}, attrs)
    |> Repo.insert()
  end
end
