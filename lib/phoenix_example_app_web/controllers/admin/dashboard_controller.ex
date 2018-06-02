defmodule PhoenixExampleAppWeb.Admin.DashboardController do
  use PhoenixExampleAppWeb, :controller

  alias PhoenixExampleApp.Accounts.Administrator
  alias PhoenixExampleApp.Repo

  def index(conn, _params) do
    with administrators <- Repo.aggregate(Administrator, :count, :id) do
      render(conn, "index.html", administrators: administrators)
    end
  end
end
