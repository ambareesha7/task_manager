defmodule TaskManager.ManageTasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tasks" do
    field :dependent_id, :string
    field :is_dependent, :boolean, default: false
    field :status, :boolean, default: false
    field :task_name, :string
    field :group_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:task_name, :status, :is_dependent, :dependent_id])
    |> validate_required([:task_name, :status, :is_dependent, :dependent_id])
    |> unique_constraint(:task_name)
  end
end
