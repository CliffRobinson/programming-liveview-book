defmodule PentoWeb.QuestionLive.Index do
  use PentoWeb, :live_view

  alias Pento.FAQs
  alias Pento.FAQs.Question

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :question_collection, list_question())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Question")
    |> assign(:question, FAQs.get_question!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Question")
    |> assign(:question, %Question{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Question")
    |> assign(:question, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    question = FAQs.get_question!(id)
    {:ok, _} = FAQs.delete_question(question)

    {:noreply, assign(socket, :question_collection, list_question())}
  end

  defp list_question do
    FAQs.list_question()
  end
end
