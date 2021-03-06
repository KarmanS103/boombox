defmodule BoomBox.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash, :string
    has_many :following_artist, BoomBox.Following_Artists.Following_Artist

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email])
    |> add_password_hash(attrs["password"])
    |> validate_required([:email, :password_hash])
  end
  
  def add_password_hash(cset, nil) do
    cset
  end
  
  def add_password_hash(cset, password) do
    change(cset, Argon2.add_hash(password))
  end
end
