defmodule TaskManager.ManageTasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TaskManager.ManageTasks` context.
  """

  @doc """
  Generate a unique task task_name.
  """
  def unique_task_task_name, do: "some task_name#{System.unique_integer([:positive])}"

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        dependent_id: "some dependent_id",
        is_dependent: true,
        status: true,
        task_name: unique_task_task_name()
      })
      |> TaskManager.ManageTasks.create_task()

    task
  end
end
