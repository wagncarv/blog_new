defmodule BlogNew.Posts.Delete do
  alias BlogNew.Repo

  def delete(post) do
    Repo.delete!(post)
  end
end
