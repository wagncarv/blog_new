defmodule BlogNew.Posts.Get do
    alias BlogNew.{Posts.Post, Repo}

    def by_id(id) do
        Repo.get(Post, id)
        |> handle_by_id()
    end

    def all do
        Repo.all(Post)
    end

    defp handle_by_id(%Post{} = post), do: post
    defp handle_by_id(nil), do: {:error, "User not found"}
end
