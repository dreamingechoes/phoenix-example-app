defmodule PhoenixExampleAppWeb.Plug.CurrentAdmin do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    assign(
      conn,
      :current_admin,
      PhoenixExampleApp.Guardian.Plug.current_resource(conn)
    )
  end
end
