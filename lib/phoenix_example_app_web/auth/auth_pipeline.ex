defmodule PhoenixExampleAppWeb.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :phoenix_example_app,
    module: PhoenixExampleApp.Guardian,
    error_handler: PhoenixExampleApp.Guardian.AuthErrorHandler

  # If there is a session token, validate it
  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  # If there is an authorization header, validate it
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  # Load the user if either of the verifications worked
  plug(Guardian.Plug.LoadResource, allow_blank: true)
end
