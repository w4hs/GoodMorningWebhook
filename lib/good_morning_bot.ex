defmodule GoodMorningBot do
  defp get_random_message do
    GoodMorningBot.RandomGreetingServer.get_random_greeting()
  end

  def send_message_to_discord do
    get_random_message()
    |>GoodMorningBot.Adapter.DiscordWebHook.send_message()
  end
end
