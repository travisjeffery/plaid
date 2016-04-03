defmodule Plaid do
  use HTTPoison.Base

  products = ["auth", "connect", "income", "info", "risk"]

  for product <- products do
    def unquote(:"add_#{product}_user")(args) do
      add_user(unquote(product), args)
    end
  end
  
  def add_user(product, args) do
    post(product, [body: args])
  end

  def process_request_body(body) do
    body |> Poison.encode!
  end

  def process_url(url) do
    "https://api.plaid.com/" <> url
  end

  def process_request_headers(headers) do
    Enum.into(headers, [])
  end

  def process_response_body(body) do
    body |> Poison.decode!
  end

  defp client_id, do: Application.get_env(:plaid, :client_id)

  defp secret, do: Application.get_env(:plaid, :secret)

  defp env, do: Application.get_env(:plaid, :env)
end
