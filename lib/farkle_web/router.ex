defmodule FarkleWeb.Router do
  use FarkleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FarkleWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/games", GameController
    resources "/players", PlayerController
    resources "/scores", ScoreController
    resources "/rolls", RollController

    get "/join", GameController, :join
  end

  # Other scopes may use custom stacks.
  # scope "/api", FarkleWeb do
  #   pipe_through :api
  # end
end
