defmodule Tesla.Middleware.ContentLength do
    @behaviour Tesla.Middleware

    def call(env, next, _) do
        # env.headers = Map.put(env, "Content-Length", String.length(env.body))
        Tesla.run(env, next)
    end
end

defmodule Graph.Client do
    use Tesla

    plug Tesla.Middleware.BaseUrl, "http://orientdb:2480/"
    plug Tesla.Middleware.Headers, %{"Accept-Encoding" => "gzip,deflate"}
    plug Tesla.Middleware.BasicAuth, username: "root", password: "root"
    plug Tesla.Middleware.JSON

    def connect(database) do
        get("/connect/" <> database)
    end

    def read(database, query) do
        get("/query/"<>database<>"/sql/"<>URI.encode(query)<>"/10/*:-1")
    end

    defp content_length(headers, body) do
        Map.put(headers, "Content-Length", String.length(body))
    end


end