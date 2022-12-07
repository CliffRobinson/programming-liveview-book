defmodule Pento.FAQsTest do
  use Pento.DataCase

  alias Pento.FAQs

  describe "question" do
    alias Pento.FAQs.Question

    import Pento.FAQsFixtures

    @invalid_attrs %{answer: nil, downvotes: nil, question: nil, upvotes: nil}

    test "list_question/0 returns all question" do
      question = question_fixture()
      assert FAQs.list_question() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert FAQs.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      valid_attrs = %{answer: "some answer", downvotes: 42, question: "some question", upvotes: 42}

      assert {:ok, %Question{} = question} = FAQs.create_question(valid_attrs)
      assert question.answer == "some answer"
      assert question.downvotes == 42
      assert question.question == "some question"
      assert question.upvotes == 42
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FAQs.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      update_attrs = %{answer: "some updated answer", downvotes: 43, question: "some updated question", upvotes: 43}

      assert {:ok, %Question{} = question} = FAQs.update_question(question, update_attrs)
      assert question.answer == "some updated answer"
      assert question.downvotes == 43
      assert question.question == "some updated question"
      assert question.upvotes == 43
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = FAQs.update_question(question, @invalid_attrs)
      assert question == FAQs.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = FAQs.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> FAQs.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = FAQs.change_question(question)
    end
  end
end
