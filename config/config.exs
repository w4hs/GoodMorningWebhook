import Config

config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

config :good_morning_bot, GoodMorningBot.Scheduler,
    timezone: "Asia/Dhaka",
    jobs: [
      {"* 10 * * *",           {GoodMorningBot, :send_message_to_discord, []}}
    ]
