defmodule TaskManager.ManageGroupsTest do
  use TaskManager.DataCase

  alias TaskManager.ManageGroups

  describe "groups" do
    alias TaskManager.ManageGroups.Group

    import TaskManager.ManageGroupsFixtures

    @invalid_attrs %{group_name: nil}

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert ManageGroups.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert ManageGroups.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      valid_attrs = %{group_name: "some group_name"}

      assert {:ok, %Group{} = group} = ManageGroups.create_group(valid_attrs)
      assert group.group_name == "some group_name"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ManageGroups.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      update_attrs = %{group_name: "some updated group_name"}

      assert {:ok, %Group{} = group} = ManageGroups.update_group(group, update_attrs)
      assert group.group_name == "some updated group_name"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = ManageGroups.update_group(group, @invalid_attrs)
      assert group == ManageGroups.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = ManageGroups.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> ManageGroups.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = ManageGroups.change_group(group)
    end
  end
end
