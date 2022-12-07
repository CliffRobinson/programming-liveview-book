defmodule Pento.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:question) do
      add :question, :string
      add :answer, :string
      add :upvotes, :integer
      add :downvotes, :integer

      timestamps()
    end
  end
end
