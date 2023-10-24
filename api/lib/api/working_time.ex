defmodule Api.WorkingTime do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "workingtimes" do
    field :start, :utc_datetime
    field :end, :utc_datetime
    belongs_to :user, Api.User
  end

  @required_fields ~w(start end user_id)
  @optional_fields []

  def changeset(working_time, params \\ %{}) do
    working_time
    |> cast(params, @required_fields, @optional_fields)
  end
end
