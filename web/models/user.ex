defmodule Rumbl.User do
  # defstruct [:id, :name, :username, :password]
  use Rumbl.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name username), []) #make these fields compulsory and then cast all values to their schema types, rejecting everything else
    |> validate_length(:username, min: 1, max: 20)

    #both cast and validate_length are defined in the Ecto.Changset module which we import as part of all models in web/web.ex
  end
end