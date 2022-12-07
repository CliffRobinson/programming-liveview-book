defmodule Pento.FAQs.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "question" do
    field :answer, :string
    field :downvotes, :integer
    field :question, :string
    field :upvotes, :integer

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :answer, :upvotes, :downvotes])
    |> validate_required([:question, :answer, :upvotes, :downvotes])
  end
end
