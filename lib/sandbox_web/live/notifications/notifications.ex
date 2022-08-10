defmodule SandboxWeb.Live.LiveNotification.Notification do
  use Phoenix.LiveView
  alias Phoenix.PubSub

  def mount(_params, _session, socket) do
    PubSub.subscribe(Sandbox.PubSub, "notifications") |> IO.inspect(label: "SUBSCRIBE")
    {:ok, socket}
  end

  def handle_event("push_noti", _, socket) do
    IO.inspect(PubSub)

    PubSub.broadcast(Sandbox.PubSub, "notifications", {:Notification, %{id: 123, msg: "New Notification", type: "event"}})
    |> IO.inspect(label: "BROADCAST")

    Process.info(self(), :messages) |> IO.inspect(label: "INFO")
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
      <div>
        <button class="btn" phx-click="push_noti">
        NOTIFICATIONS</button>
      </div>
    """
  end
end
