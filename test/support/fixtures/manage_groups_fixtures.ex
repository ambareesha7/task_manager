defmodule TaskManager.ManageGroupsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TaskManager.ManageGroups` context.
  """

  @doc """
  Generate a group.
  """
  def group_fixture(attrs \\ %{}) do
    {:ok, group} =
      attrs
      |> Enum.into(%{
        group_name: "some group_name"
      })
      |> TaskManager.ManageGroups.create_group()

    group
  end
end
