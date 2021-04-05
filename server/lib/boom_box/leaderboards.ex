defmodule BoomBox.Leaderboards do
  @moduledoc """
  The Leaderboards context.
  """

  import Ecto.Query, warn: false
  alias BoomBox.Repo

  alias BoomBox.Leaderboards.Leaderboard

  @doc """
  Returns the list of leaderboard.

  ## Examples

      iex> list_leaderboard()
      [%Leaderboard{}, ...]

  """
  def list_leaderboard do
    Repo.all(Leaderboard)
  end

  @doc """
  Gets a single leaderboard.

  Raises `Ecto.NoResultsError` if the Leaderboard does not exist.

  ## Examples

      iex> get_leaderboard!(123)
      %Leaderboard{}

      iex> get_leaderboard!(456)
      ** (Ecto.NoResultsError)

  """
  def get_leaderboard!(id), do: Repo.get!(Leaderboard, id)

  @doc """
  Creates a leaderboard.

  ## Examples

      iex> create_leaderboard(%{field: value})
      {:ok, %Leaderboard{}}

      iex> create_leaderboard(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_leaderboard(attrs \\ %{}) do
    %Leaderboard{}
    |> Leaderboard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a leaderboard.

  ## Examples

      iex> update_leaderboard(leaderboard, %{field: new_value})
      {:ok, %Leaderboard{}}

      iex> update_leaderboard(leaderboard, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_leaderboard(%Leaderboard{} = leaderboard, attrs) do
    leaderboard
    |> Leaderboard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a leaderboard.

  ## Examples

      iex> delete_leaderboard(leaderboard)
      {:ok, %Leaderboard{}}

      iex> delete_leaderboard(leaderboard)
      {:error, %Ecto.Changeset{}}

  """
  def delete_leaderboard(%Leaderboard{} = leaderboard) do
    Repo.delete(leaderboard)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking leaderboard changes.

  ## Examples

      iex> change_leaderboard(leaderboard)
      %Ecto.Changeset{data: %Leaderboard{}}

  """
  def change_leaderboard(%Leaderboard{} = leaderboard, attrs \\ %{}) do
    Leaderboard.changeset(leaderboard, attrs)
  end
end
