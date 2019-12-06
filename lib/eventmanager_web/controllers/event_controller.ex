defmodule EventmanagerWeb.EventController do
  use EventmanagerWeb, :controller

  alias Eventmanager.Manager
  alias Eventmanager.Manager.Event

  def index(conn, _params) do
    events = Manager.list_events()
    render(conn, "index.html", events: events, token: get_csrf_token())
  end

  def new(conn, _params) do
    changeset = Manager.change_event(%Event{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"event" => event_params}) do
    case Manager.create_event(event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(to: Routes.event_path(conn, :show, event))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Manager.get_event!(id)
    render(conn, "show.html", event: event)
  end

  def edit(conn, %{"id" => id}) do
    event = Manager.get_event!(id)
    changeset = Manager.change_event(event)
    render(conn, "edit.html", event: event, changeset: changeset)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Manager.get_event!(id)

    case Manager.update_event(event, event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event updated successfully.")
        |> redirect(to: Routes.event_path(conn, :show, event))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", event: event, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Manager.get_event!(id)
    {:ok, _event} = Manager.delete_event(event)

    conn
    |> put_flash(:info, "Event deleted successfully.")
    |> redirect(to: Routes.event_path(conn, :index))
  end

  def mynew(conn, _params) do
    changeset = Manager.change_event(%Event{})
    render(conn, "new.html", changeset: changeset)
  end

  def invite(conn, %{"invitation" => invitation_params}) do
    IO.inspect invitation_params
    user = Map.get(invitation_params, "user_id")
    event = Map.get(invitation_params, "event_id")
    IO.inspect user
    IO.inspect event

    case Manager.invite(user, event) do
      {:ok, _invitation} ->
        conn
        |> put_flash(:info, "Invitation Set Successfully")
        |> redirect(to: Routes.event_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end
