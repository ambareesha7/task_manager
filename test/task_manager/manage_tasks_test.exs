defmodule TaskManager.ManageTasksTest do
  use TaskManager.DataCase

  alias TaskManager.ManageTasks

  describe "tasks" do
    alias TaskManager.ManageTasks.Task

    import TaskManager.ManageTasksFixtures

    @invalid_attrs %{dependent_id: nil, is_dependent: nil, status: nil, task_name: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert ManageTasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert ManageTasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{
        dependent_id: "some dependent_id",
        is_dependent: true,
        status: true,
        task_name: "some task_name"
      }

      assert {:ok, %Task{} = task} = ManageTasks.create_task(valid_attrs)
      assert task.dependent_id == "some dependent_id"
      assert task.is_dependent == true
      assert task.status == true
      assert task.task_name == "some task_name"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ManageTasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()

      update_attrs = %{
        dependent_id: "some updated dependent_id",
        is_dependent: false,
        status: false,
        task_name: "some updated task_name"
      }

      assert {:ok, %Task{} = task} = ManageTasks.update_task(task, update_attrs)
      assert task.dependent_id == "some updated dependent_id"
      assert task.is_dependent == false
      assert task.status == false
      assert task.task_name == "some updated task_name"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = ManageTasks.update_task(task, @invalid_attrs)
      assert task == ManageTasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = ManageTasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> ManageTasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = ManageTasks.change_task(task)
    end
  end
end
