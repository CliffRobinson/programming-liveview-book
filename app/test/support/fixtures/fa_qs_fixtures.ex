defmodule Pento.FAQsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pento.FAQs` context.
  """

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{
        answer: "some answer",
        downvotes: 42,
        question: "some question",
        upvotes: 42
      })
      |> Pento.FAQs.create_question()

    question
  end
end
