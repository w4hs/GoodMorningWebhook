use Mix.Release.Config, default_environment: :prod

environment :prod do
  set(include_erts: true)
  set(include_src: false)
  set(cookie: :good_morning_bot)
end

release :good_morning_bot do
  set(version: current_version(:good_monring_bot))
end
