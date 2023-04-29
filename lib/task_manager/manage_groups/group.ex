defmodule TaskManager.ManageGroups.Group do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "groups" do
    field :group_name, :string

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:group_name])
    |> validate_required([:group_name])
  end
end
