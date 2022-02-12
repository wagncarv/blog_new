defmodule BlogNew.Posts.Post do
    use Ecto.Schema
    import Ecto.Changeset

    @required_params [:title, :description]

    @derive {Jason.Encoder, only: [:title, :description]}

    schema "posts" do
        field :title, :string
        field :description, :string
        timestamps()
    end

    def changeset(struct \\ %__MODULE__{}, attrs \\ %{}) do
        struct
        |> cast(attrs, @required_params)
        |> validate_required(@required_params, message: "mandatory field")
    end

end
