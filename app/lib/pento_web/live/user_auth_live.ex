defmodule PentoWeb.UserAuthLive do
  import Phoenix.LiveView
  import Phoenix.Component
  alias Pento.Accounts

  def on_mount(_porque, _params, %{"user_token" => user_token}, socket) do
    socket =
      socket
      |> assign_new(:current_user, fn -> Accounts.get_user_by_session_token(user_token) end)

    if socket.assigns.current_user do
      {:cont, socket}
    else
      {:halt, redirect(socket, to: "/login")}
    end
  end
end
