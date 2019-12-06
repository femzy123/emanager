defmodule Eventmanager.Manager.Invitation do
  use Ecto.Schema
  import Ecto.Changeset

  alias Eventmanager.Manager.Event
  alias Eventmanager.Users.User

  schema "invitations" do
    belongs_to :user, User
    belongs_to :event, Event

    timestamps()
  end

  @doc false
  def changeset(invitation, attrs) do
    invitation
    |> cast(attrs, [:user_id, :event_id])
    |> validate_required([])
  end
end
