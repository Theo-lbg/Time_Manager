defmodule Api.Repo.Migrations.CreateWorkingTimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :start, :utc_datetime
      add :end, :utc_datetime
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end

    create index(:workingtimes, [:user_id])
  end
end
