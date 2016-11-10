defmodule CodeCorps.StripeAccountPolicy do
  import CodeCorps.Helpers.Policy,
    only: [admin_or_higher?: 1, get_membership: 2, get_role: 1, owner?: 1]

  alias CodeCorps.StripeAccount
  alias CodeCorps.User
  alias CodeCorps.OrganizationMembership
  alias Ecto.Changeset

  def index?(%User{admin: true}, %StripeAccount{}), do: true
  def index?(%User{} = user, %StripeAccount{} = stripe_account), do: stripe_account |> get_membership(user) |> get_role |> admin_or_higher?

  def show?(%User{admin: true}, %StripeAccount{}), do: true
  def show?(%User{} = user, %StripeAccount{} = stripe_account), do: stripe_account |> get_membership(user) |> get_role |> owner?
  def show?(%User{}, %StripeAccount{}), do: false
end
