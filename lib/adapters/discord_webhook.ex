defmodule GoodMorningBot.Adapter.DiscordWebHook do
  use Tesla

  plug Tesla.Middleware.BaseUrl, System.get_env("DISCORD_WEBHOOK")
  plug Tesla.Middleware.JSON

  def send_message(message) do
    message_to_send = %{content: message}
    post("", message_to_send)
  end
end
