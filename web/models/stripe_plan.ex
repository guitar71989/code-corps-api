defmodule CodeCorps.StripePlan do
  @moduledoc """
  Represents a `Plan` object created using the Stripe API

  ## Fields
  * `amount` - A positive integer, the amount in cents to be charged for this plan
  * `created` - A timestamp, indicating when the plan was created by Stripe
  * `id_from_stripe` - Stripe's `id`
  * `name` - A friendly display name for the plan
  """

  use CodeCorps.Web, :model

  schema "stripe_plans" do
    field :amount, :integer
    field :created, Ecto.DateTime
    field :id_from_stripe, :string, null: false
    field :name, :string

    belongs_to :project, CodeCorps.Project

    timestamps()
  end

  def create_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:id_from_stripe, :project_id])
    |> validate_required([:id_from_stripe, :project_id])
    |> unique_constraint(:id_from_stripe)
    |> assoc_constraint(:project)
  end
end
