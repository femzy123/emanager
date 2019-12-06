defmodule Eventmanager.Manager.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias Eventmanager.Users.User

  schema "events" do
    field :date, :date
    field :description, :string
    field :location, :string
    field :name, :string
    field :status, :string
    many_to_many(:users, User, join_through: "invitations", on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :description, :date, :location, :status])
    |> validate_required([:name, :description, :date, :location, :status])
  end
end
