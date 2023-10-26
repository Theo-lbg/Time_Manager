defmodule Api.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :username, :string
      add :email, :string, null: false
      add :role, :string, default: "user"
      add :team, :binary_id, default: nil

      timestamps()
    end

    create unique_index(:users, [:email])
    execute("ALTER TABLE users ADD CONSTRAINT email_formatcheck CHECK (email ~* '^[A-Za-z0-9.%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')")
  end
end
