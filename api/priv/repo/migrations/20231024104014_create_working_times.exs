defmodule Api.Repo.Migrations.CreateWorkingTimes do
  use Ecto.Migration

  def change do
    create table(:working_times, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :start, :utc_datetime
      add :end, :utc_datetime, null: true, default: fragment("null")
      add :user, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:working_times, [:user])
  end
end
