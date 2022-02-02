defmodule BlogNewWeb.PostController do
    use BlogNewWeb, :controller

    def index(conn, _params) do
        posts = [
            %{
                title: "Phoenix"
            },
            %{
                title: "Elixir"
            },
            %{
                title: "Postgres"
            }
        ]
        render(conn, "index.html", posts: posts, valor: 2)
    end
end
