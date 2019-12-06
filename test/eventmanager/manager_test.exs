defmodule Eventmanager.ManagerTest do
  use Eventmanager.DataCase

  alias Eventmanager.Manager

  describe "events" do
    alias Eventmanager.Manager.Event

    @valid_attrs %{date: ~D[2010-04-17], description: "some description", location: "some location", name: "some name", status: "some status"}
    @update_attrs %{date: ~D[2011-05-18], description: "some updated description", location: "some updated location", name: "some updated name", status: "some updated status"}
    @invalid_attrs %{date: nil, description: nil, location: nil, name: nil, status: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manager.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Manager.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Manager.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Manager.create_event(@valid_attrs)
      assert event.date == ~D[2010-04-17]
      assert event.description == "some description"
      assert event.location == "some location"
      assert event.name == "some name"
      assert event.status == "some status"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manager.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = Manager.update_event(event, @update_attrs)
      assert event.date == ~D[2011-05-18]
      assert event.description == "some updated description"
      assert event.location == "some updated location"
      assert event.name == "some updated name"
      assert event.status == "some updated status"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Manager.update_event(event, @invalid_attrs)
      assert event == Manager.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Manager.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Manager.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Manager.change_event(event)
    end
  end

  describe "invitations" do
    alias Eventmanager.Manager.Invitation

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def invitation_fixture(attrs \\ %{}) do
      {:ok, invitation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manager.create_invitation()

      invitation
    end

    test "list_invitations/0 returns all invitations" do
      invitation = invitation_fixture()
      assert Manager.list_invitations() == [invitation]
    end

    test "get_invitation!/1 returns the invitation with given id" do
      invitation = invitation_fixture()
      assert Manager.get_invitation!(invitation.id) == invitation
    end

    test "create_invitation/1 with valid data creates a invitation" do
      assert {:ok, %Invitation{} = invitation} = Manager.create_invitation(@valid_attrs)
    end

    test "create_invitation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manager.create_invitation(@invalid_attrs)
    end

    test "update_invitation/2 with valid data updates the invitation" do
      invitation = invitation_fixture()
      assert {:ok, %Invitation{} = invitation} = Manager.update_invitation(invitation, @update_attrs)
    end

    test "update_invitation/2 with invalid data returns error changeset" do
      invitation = invitation_fixture()
      assert {:error, %Ecto.Changeset{}} = Manager.update_invitation(invitation, @invalid_attrs)
      assert invitation == Manager.get_invitation!(invitation.id)
    end

    test "delete_invitation/1 deletes the invitation" do
      invitation = invitation_fixture()
      assert {:ok, %Invitation{}} = Manager.delete_invitation(invitation)
      assert_raise Ecto.NoResultsError, fn -> Manager.get_invitation!(invitation.id) end
    end

    test "change_invitation/1 returns a invitation changeset" do
      invitation = invitation_fixture()
      assert %Ecto.Changeset{} = Manager.change_invitation(invitation)
    end
  end
end
