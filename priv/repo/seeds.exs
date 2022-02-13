# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BlogNew.Repo.insert!(%BlogNew.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias BlogNew.{Posts.Post, Repo}

[
  Post.changeset(%Post{}, %{title: "Phoenix", description: "Framework"}),
  Post.changeset(%Post{}, %{title: "Elixir", description: "Programming language"}),
  Post.changeset(%Post{}, %{title: "Liveview", description: "front end"})
]
|> Enum.map(&BlogNew.Repo.insert!/1)
