defmodule GoodMorningBot.RandomGreetingServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :random_greeting_server)
  end

  def get_random_greeting do
    GenServer.call(:random_greeting_server, :get_greetings)
  end

  @impl GenServer
  def init(_) do
    {:ok, load_greetings()}
  end

  @impl GenServer
  def handle_call(:get_greetings, _from, state) do
    {:reply, random_greeting(state), state}
  end

  defp load_greetings do
    file_path = Path.join(:code.priv_dir(:good_morning_bot), "language_greeting_pair.txt")
    {:ok, file} = File.read(file_path)
    String.split(file, "\n")
  end

  defp clean_up(greeting_dirty) do
    Regex.run(~r/"(.*)": "(.*)"/, greeting_dirty)
  end

  defp extract_language_and_greeting(list_of_info) do
    [_, language, greeting] = list_of_info
    greeting <> " Language: " <> language
  end

  defp random_greeting(greetings) do
    greetings
    |> Enum.random()
    |> clean_up()
    |> extract_language_and_greeting()
  end
end
