defmodule Eventmanager.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    create table(:invitations) do
      add :user_id, references(:users, on_delete: :nothing)
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end

    create index(:invitations, [:user_id])
    create index(:invitations, [:event_id])

    create(unique_index(:invitations, [:user_id, :event_id]))
  end
end
