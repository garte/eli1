defmodule BackendWeb.Api.ContextController do
    use BackendWeb, :controller
    
      def ping(conn, _params) do
        rs = Graph.Client.read("ln1", "SELECT FROM ORole")
        IO.inspect(rs)
        conn |> json(rs.body)
      end

      def ping_post(conn, params) do
          conn |> json(%{"ping" => "PONG", "data" => params})
      end
end