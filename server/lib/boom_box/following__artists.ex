defmodule BoomBox.Following_Artists do
  @moduledoc """
  The Following_Artists context.
  """

  import Ecto.Query, warn: false
  alias BoomBox.Repo

  alias BoomBox.Following_Artists.Following_Artist

  @doc """
  Returns the list of following_artist.

  ## Examples

      iex> list_following_artist()
      [%Following_Artist{}, ...]

  """
  def list_following_artist do
    Repo.all(Following_Artist)
  end

  @doc """
  Gets a single following__artist.

  Raises `Ecto.NoResultsError` if the Following  artist does not exist.

  ## Examples

      iex> get_following__artist!(123)
      %Following_Artist{}

      iex> get_following__artist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_following__artist!(id), do: Repo.get!(Following_Artist, id)

  @doc """
  Creates a following__artist.

  ## Examples

      iex> create_following__artist(%{field: value})
      {:ok, %Following_Artist{}}

      iex> create_following__artist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_following__artist(attrs \\ %{}) do
    %Following_Artist{}
    |> Following_Artist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a following__artist.

  ## Examples

      iex> update_following__artist(following__artist, %{field: new_value})
      {:ok, %Following_Artist{}}

      iex> update_following__artist(following__artist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_following__artist(%Following_Artist{} = following__artist, attrs) do
    following__artist
    |> Following_Artist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a following__artist.

  ## Examples

      iex> delete_following__artist(following__artist)
      {:ok, %Following_Artist{}}

      iex> delete_following__artist(following__artist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_following__artist(%Following_Artist{} = following__artist) do
    Repo.delete(following__artist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking following__artist changes.

  ## Examples

      iex> change_following__artist(following__artist)
      %Ecto.Changeset{data: %Following_Artist{}}

  """
  def change_following__artist(%Following_Artist{} = following__artist, attrs \\ %{}) do
    Following_Artist.changeset(following__artist, attrs)
  end
end
