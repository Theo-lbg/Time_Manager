defmodule Api.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "clocks" do
    field :time, :utc_datetime
    field :status, :boolean, default: true
    belongs_to :user, Api.User
  end

  @required_fields ~w(time status user_id)
  @optional_fields []

  def changeset(clock, params \\ %{}) do
    clock
    |> cast(params, @required_fields, @optional_fields)
  end
end
