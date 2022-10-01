defmodule PentoWeb.WrongLive do
  use Phoenix.LiveView, layout: {PentoWeb.LayoutView, "live.html"}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, score: 0, message: "Make a guess:", time: DateTime.utc_now())}
  end

  def render(assigns) do
    ~H"""
      <h1>Your score: <%= @score %></h1>
      <h2>
        <%= @message %>
      </h2>
      <h2>
        It's <%= @time %>
      </h2>

      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number={n}><%= n %></a>
      <% end %>
    """
  end

  def handle_event("guess", %{"number" => guess} = _unsigned_params, socket) do
    rand = :rand.uniform(10)

    assigns =
      if rand == String.to_integer(guess) do
        %{
          message: "Your guess #{guess} was correct! Guess again.",
          score: socket.assigns.score + 1
        }
      else
        %{
          message: "Your guess #{guess} was wrong, guess again.",
          score: socket.assigns.score - 1
        }
      end

    assigns = Map.put(assigns, :time, DateTime.utc_now())

    {:noreply, assign(socket, assigns)}
  end
end
