defmodule Eventmanager.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :description, :text
      add :date, :date
      add :location, :string, default: "active"
      add :status, :string

      timestamps()
    end

  end
end
