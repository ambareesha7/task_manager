defmodule TaskManager.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :task_name, :string
      add :status, :boolean, default: false, null: false
      add :is_dependent, :boolean, default: false, null: false
      add :dependent_id, :string
      add :group_id, references(:groups, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create unique_index(:tasks, [:task_name])
    create index(:tasks, [:group_id])
  end
end
