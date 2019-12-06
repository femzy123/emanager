defmodule Eventmanager.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  alias Eventmanager.Manager.Event

  schema "users" do
    pow_user_fields()
    many_to_many(:events, Event, join_through: "invitations", on_replace: :delete)

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> pow_changeset(attrs)
  end
end
