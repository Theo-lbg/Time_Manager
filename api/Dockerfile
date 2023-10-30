FROM elixir:latest

WORKDIR /app

# Installer Hex et Rebar
RUN mix local.hex --force 

COPY mix.exs mix.lock ./

RUN mix deps.get

# Copiez d'abord le projet
COPY . .

EXPOSE 4000

CMD ["mix", "phx.server"]
